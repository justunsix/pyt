output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "ai_foundry_id" {
  description = "ID of the AI Foundry account"
  value       = try(azurerm_cognitive_account.ai_foundry[0].id, null)
}

output "ai_foundry_endpoint" {
  description = "Endpoint of the AI Foundry account"
  value       = try(azurerm_cognitive_account.ai_foundry[0].endpoint, null)
}

output "project_id" {
  description = "ID of the Foundry project"
  value       = try(azurerm_cognitive_account_project.project_primary[0].id, null)
}

output "project_endpoints" {
  description = "Endpoints of the Foundry project"
  value       = try(azurerm_cognitive_account_project.project_primary[0].endpoints, null)
}

output "chat_model_deployment_id" {
  description = "ID of the chat model deployment"
  value       = try(azurerm_cognitive_deployment.chat_model[0].id, null)
}

output "image_model_deployment_id" {
  description = "ID of the image model deployment"
  value       = try(azurerm_cognitive_deployment.image_model[0].id, null)
}

output "video_model_deployment_id" {
  description = "ID of the video model deployment"
  value       = try(azurerm_cognitive_deployment.video_model[0].id, null)
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = try(azurerm_storage_account.lab[0].id, null)
}

output "ai_language_id" {
  description = "ID of Azure AI Language account"
  value       = try(azurerm_cognitive_account.ai_language[0].id, null)
}

output "translator_id" {
  description = "ID of Azure Translator account"
  value       = try(azurerm_cognitive_account.translator[0].id, null)
}

output "ai_search_id" {
  description = "ID of Azure AI Search service"
  value       = try(azurerm_search_service.ai_search[0].id, null)
}

output "document_intelligence_id" {
  description = "ID of Azure AI Document Intelligence account"
  value       = try(azurerm_cognitive_account.document_intelligence[0].id, null)
}
