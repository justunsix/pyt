from dotenv import load_dotenv
from subprocess import call

import os

# Import namespaces
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient


def main():
    try:
        # Clear the console
        _ = call("clear" if os.name == "posix" else "cls")

        # Get Configuration Settings
        load_dotenv()
        foundry_endpoint = os.getenv("FOUNDRY_ENDPOINT")
        agent_name = os.getenv("AGENT_NAME")

        # Validate required environment variables
        if not foundry_endpoint:
            raise ValueError("FOUNDRY_ENDPOINT environment variable is not set.")
        if not agent_name:
            raise ValueError("AGENT_NAME environment variable is not set.")

        # Get project client
        project_client = AIProjectClient(
            endpoint=foundry_endpoint,
            credential=DefaultAzureCredential(),
        )

        # Get an OpenAI client
        openai_client = project_client.get_openai_client()

        # Use the agent to get a response
        prompt = input("User prompt: ")
        response = openai_client.responses.create(
            input=[{"role": "user", "content": prompt}],
            extra_body={
                "agent_reference": {"name": agent_name, "type": "agent_reference"}
            },
        )

        print(f"{agent_name}: {response.output_text}")

        print(f"\nResponse Details: {response.model_dump_json(indent=2)}")

    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    main()
