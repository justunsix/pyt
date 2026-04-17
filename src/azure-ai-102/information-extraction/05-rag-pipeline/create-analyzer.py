import os

from azure.ai.contentunderstanding import ContentUnderstandingClient
from azure.core.credentials import AzureKeyCredential
from dotenv import load_dotenv


def main():
    """Create a Content Understanding analyzer for extracting content from documents."""

    try:
        # Get config settings
        load_dotenv()
        endpoint = os.getenv("FOUNDRY_ENDPOINT")
        key = os.getenv("FOUNDRY_KEY")

        if not endpoint:
            raise ValueError("FOUNDRY_ENDPOINT environment variable is not set.")
        if not key:
            raise ValueError("FOUNDRY_KEY environment variable is not set.")

        analyzer_id = "rag_document_analyzer"

        print(f"Creating analyzer '{analyzer_id}'...")

        # Create the Content Understanding client
        client = ContentUnderstandingClient(
            endpoint=endpoint, credential=AzureKeyCredential(key)
        )

        # Define the analyzer schema for document extraction
        analyzer_definition = {
            "description": "Analyzer for extracting structured content from travel documents",
            "baseAnalyzerId": "prebuilt-document",
            "models": {"completion": "gpt-4.1", "embedding": "text-embedding-3-large"},
            "config": {"returnDetails": True},
            "fieldSchema": {
                "fields": {
                    "Summary": {
                        "type": "string",
                        "method": "generate",
                        "description": "A brief summary of the document content",
                    },
                    "KeyTopics": {
                        "type": "array",
                        "method": "generate",
                        "description": "Key topics or themes covered in the document",
                        "items": {"type": "string"},
                    },
                }
            },
        }

        # Create the analyzer (long-running operation)
        poller = client.begin_create_analyzer(
            analyzer_id=analyzer_id, resource=analyzer_definition, allow_replace=True
        )

        # Wait for the operation to complete
        result = poller.result()
        print(f"Analyzer '{analyzer_id}' created successfully.")

    except Exception as ex:
        print(f"Error: {ex}")


if __name__ == "__main__":
    main()
