#!/usr/bin/env bash

# Source:
# https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-cli
# https://learn.microsoft.com/en-us/azure/storage/blobs/blob-containers-cli
random_number=$(awk "BEGIN{srand(); print int(rand()*(700000-100000+1))+100000}")

LOCATION="canadacentral"
RESOURCE_GROUP_NAME="rgbernfive$random_number"
STORAGE_ACCOUNT_NAME="salaren$random_number"
CONTAINER_NAME="tfstate"
# https://docs.azure.cn/en-us/role-based-access-control/built-in-roles#storage-blob-data-reader
# For "Storage Blob Data Contributor"
SA_BLOB_CONTRIBUTOR_ROLE_DEFINITION_ID="ba92f5b4-2d11-453d-a403-e96b0029c9fe"

delete_rg() {
  az group delete --name "$1"
}

# Create resource group and storage account (SA) inside it
# Set up a container in SA
create_rg_and_storage() {

  az group create --name "$RESOURCE_GROUP_NAME" --location $LOCATION
  az storage account create \
    --name "$STORAGE_ACCOUNT_NAME" \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2 \
    --min-tls-version TLS1_2 \
    --allow-blob-public-access false

  # Create a container
  az storage container create \
    --name $CONTAINER_NAME \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --auth-mode login

  echo "Created Storage account with name: $STORAGE_ACCOUNT_NAME"
  scope="$(az storage account show --name "$STORAGE_ACCOUNT_NAME" --resource-group "$RESOURCE_GROUP_NAME" --query id -o tsv)"
  echo "Storage account scope: $scope"

}

# Set contributor (read/write) role assignment for curent user
set_role_for_storage() {

  az role assignment create \
    --role $SA_BLOB_CONTRIBUTOR_ROLE_DEFINITION_ID \
    --assignee "$(az ad signed-in-user show --query id -o tsv)" \
    --scope "$(az storage account show --name "$STORAGE_ACCOUNT" --resource-group "$RESOURCE_GROUP" --query id -o tsv)"
}

if [ "$1" = "--create" ]; then
  create_rg_and_storage
  set_role_for_storage
fi

if [ "$1" = "--delete" ]; then
  # Delete resource group provided by argument after --delete
  delete_rg "$2"
fi
