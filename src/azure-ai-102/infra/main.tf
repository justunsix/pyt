## Create a random string
## 
resource "random_string" "unique" {
  length  = 8
  numeric = true
  special = false
  lower   = true
  upper   = false
}

locals {
  create_project_primary = var.create_ai_foundry && var.create_project

  create_chat_model_deployment  = var.create_ai_foundry && var.create_chat_model_deployment
  create_image_model_deployment = var.create_ai_foundry && var.create_image_model_deployment
  create_video_model_deployment = var.create_ai_foundry && var.create_video_model_deployment
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
  count                = local.create_project_primary ? 1 : 0
  name                 = "myproject"
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id
  location             = azurerm_resource_group.rg.location

  identity {
    type = "SystemAssigned"
  }
}

## Create a model deployment in the AI Foundry resource
resource "azurerm_cognitive_deployment" "chat_model" {
  count = local.create_chat_model_deployment ? 1 : 0

  depends_on = [
    azurerm_cognitive_account.ai_foundry
  ]

  name                 = var.chat_model_name
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }

  model {
    format  = "OpenAI"
    name    = var.chat_model_name
    version = var.chat_model_version
  }
}

resource "azurerm_cognitive_deployment" "image_model" {
  count = local.create_image_model_deployment ? 1 : 0

  depends_on = [
    azurerm_cognitive_account.ai_foundry
  ]

  name                 = var.image_model_name
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }

  model {
    format  = "OpenAI"
    name    = var.image_model_name
    version = var.image_model_version
  }
}

resource "azurerm_cognitive_deployment" "video_model" {
  count = local.create_video_model_deployment ? 1 : 0

  depends_on = [
    azurerm_cognitive_account.ai_foundry
  ]

  name                 = var.video_model_name
  cognitive_account_id = azurerm_cognitive_account.ai_foundry[0].id

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }

  model {
    format  = "OpenAI"
    name    = var.video_model_name
    version = var.video_model_version
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

resource "azurerm_cognitive_account" "ai_language" {
  count               = var.create_ai_language ? 1 : 0
  name                = "ailanguage${random_string.unique.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "TextAnalytics"
  sku_name            = "S"

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "azurerm_cognitive_account" "translator" {
  count               = var.create_translator ? 1 : 0
  name                = "translator${random_string.unique.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "TextTranslation"
  sku_name            = "S1"

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "azurerm_search_service" "ai_search" {
  count               = var.create_ai_search ? 1 : 0
  name                = "aisearch${random_string.unique.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "basic"
}

resource "azurerm_cognitive_account" "document_intelligence" {
  count               = var.create_document_intelligence ? 1 : 0
  name                = "docintel${random_string.unique.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FormRecognizer"
  sku_name            = "S0"

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

