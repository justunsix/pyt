from subprocess import call
import os
from dotenv import load_dotenv

# import namespaces
from openai import OpenAI
from azure.identity import DefaultAzureCredential, get_bearer_token_provider


def main():
    # Clear the console
    _ = call("clear" if os.name == "posix" else "cls")

    try:
        # Get configuration settings
        load_dotenv()
        azure_openai_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
        model_deployment = os.getenv("MODEL_DEPLOYMENT")

        # Validate required environment variables
        if not azure_openai_endpoint:
            raise ValueError("AZURE_OPENAI_ENDPOINT environment variable is not set.")
        if not model_deployment:
            raise ValueError("MODEL_DEPLOYMENT environment variable is not set.")

        # Initialize the OpenAI client
        token_provider = get_bearer_token_provider(
            DefaultAzureCredential(), "https://ai.azure.com/.default"
        )

        openai_client = OpenAI(base_url=azure_openai_endpoint, api_key=token_provider)
        # Track responses
        last_response_id = None
        # Loop until the user wants to quit
        while True:
            input_text = input('\nEnter a prompt (or type "quit" to exit): ')
            if input_text.lower() == "quit":
                break
            if len(input_text) == 0:
                print("Please enter a prompt.")
                continue

            # Get a response using streaming
            stream = openai_client.responses.create(
                model=model_deployment,
                instructions="You are a helpful AI assistant that answers questions and provides information.",
                input=input_text,
                previous_response_id=last_response_id,
                stream=True,
            )
            for event in stream:
                if event.type == "response.output_text.delta":
                    print(event.delta, end="")
                elif event.type == "response.completed":
                    last_response_id = event.response.id
            print()

    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    main()
