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

output "deployment_id" {
  description = "ID of the model deployment"
  value       = try(azurerm_cognitive_deployment.aifoundry_deployment_model[0].id, null)
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = try(azurerm_storage_account.lab[0].id, null)
}
