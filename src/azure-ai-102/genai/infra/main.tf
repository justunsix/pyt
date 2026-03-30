## Create a random string
## 
resource "random_string" "unique" {
  length  = 8
  numeric = true
  special = false
  lower   = true
  upper   = false
}

## Create a resource group for the resources to be stored in
resource "azurerm_resource_group" "rg" {
  name     = "rg-aifoundry${random_string.unique.result}"
  location = var.location
}

## Create an AI Foundry resource
resource "azurerm_cognitive_account" "ai_foundry" {
  count               = var.create_ai_foundry ? 1 : 0
  name                = "aifoundry${random_string.unique.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "AIServices"

  identity {
    type = "SystemAssigned"
  }

  sku_name = "S0"

  # required for stateful development in Foundry including agent service
  custom_subdomain_name      = "aifoundry${random_string.unique.result}"
  project_management_enabled = true

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

# Create a Foundry project (folder for organizing stateful work)
resource "azurerm_cognitive_account_project" "project_primary" {
  count                = var.create_project ? 1 : 0
  name                 = "myproject"
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id
  location             = azurerm_resource_group.rg.location

  identity {
    type = "SystemAssigned"
  }
}

## Create a model deployment in the AI Foundry resource
resource "azurerm_cognitive_deployment" "aifoundry_deployment_model" {
  count = var.create_model_deployment ? 1 : 0

  depends_on = [
    azurerm_cognitive_account.ai_foundry
  ]

  name                 = var.model_name
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }

  model {
    format  = "OpenAI"
    name    = var.model_name
    version = var.model_version
  }
}

## Create a storage account for lab data
resource "azurerm_storage_account" "lab" {
  count                    = var.create_storage_account ? 1 : 0
  name                     = "st${random_string.unique.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

