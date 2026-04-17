from dotenv import load_dotenv
import os
from azure.core.credentials import AzureKeyCredential
from azure.search.documents import SearchClient


def main():

    try:
        # Get config settings
        load_dotenv()
        search_endpoint = os.getenv("SEARCH_ENDPOINT")
        query_key = os.getenv("QUERY_KEY")
        index = os.getenv("INDEX_NAME")

        # Validate required environment variables
        if not search_endpoint:
            raise ValueError("SEARCH_ENDPOINT environment variable is not set.")
        if not query_key:
            raise ValueError("QUERY_KEY environment variable is not set.")
        if not index:
            raise ValueError("INDEX_NAME environment variable is not set.")

        # Get a search client
        search_client = SearchClient(
            search_endpoint, index, AzureKeyCredential(query_key)
        )

        # Loop until the user types 'quit'
        while True:
            # Get query text
            query_text = input("Enter a query (or type 'quit' to exit): ")
            if query_text.lower() == "quit":
                break
            if len(query_text) == 0:
                print("Please enter a query.")
                continue

            print("\n --- \n")

            # Search the index
            found_documents = search_client.search(
                search_text=query_text,
                select=["title", "locations", "persons", "keyPhrases"],
                order_by=["title"],
                include_total_count=True,
            )

            # Parse the results
            print(f"\nSearch returned {found_documents.get_count()} documents:")
            for document in found_documents:
                print(f"\nDocument: {document['title']}")
                print(" - Locations:")
                for location in document["locations"]:
                    print(f"   - {location}")
                print(" - People:")
                for person in document["persons"]:
                    print(f"   - {person}")
                print(" - Key phrases:")
                for phrase in document["keyPhrases"]:
                    print(f"   - {phrase}")

    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    main()
