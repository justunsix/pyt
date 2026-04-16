import os
from pathlib import Path
from playsound3 import playsound
from dotenv import load_dotenv
from subprocess import call

# import namespaces
from openai import AzureOpenAI
from azure.identity import DefaultAzureCredential, get_bearer_token_provider


def main():
    try:
        # Clear the console
        _ = call("clear" if os.name == "posix" else "cls")

        # Get Configuration Settings
        load_dotenv()
        endpoint = os.getenv("MODEL_ENDPOINT")
        model_deployment = os.getenv("MODEL_NAME")
        file_path = Path(__file__).parent / "speech.wav"

        # Validate required environment variables
        if not endpoint:
            raise ValueError("MODEL_ENDPOINT environment variable is not set.")
        if not model_deployment:
            raise ValueError("MODEL_DEPLOYMENT environment variable is not set.")

        # Play the speech file
        playsound(file_path)

        # Create the Azure OpenAI client
        token_provider = get_bearer_token_provider(
            DefaultAzureCredential(), "https://ai.azure.com/.default"
        )

        client = AzureOpenAI(
            azure_endpoint=endpoint,
            azure_ad_token_provider=token_provider,
            api_version="2025-03-01-preview",
        )

        # Call model to transcribe audio file
        audio_file = open(file_path, "rb")
        transcription = client.audio.transcriptions.create(
            model=model_deployment, file=audio_file, response_format="text"
        )

        print(transcription)

    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    main()
