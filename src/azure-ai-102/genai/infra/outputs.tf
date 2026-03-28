output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "ai_foundry_id" {
  description = "ID of the AI Foundry account"
  value       = azurerm_cognitive_account.ai_foundry.id
}

output "ai_foundry_endpoint" {
  description = "Endpoint of the AI Foundry account"
  value       = azurerm_cognitive_account.ai_foundry.endpoint
}

output "project_id" {
  description = "ID of the Foundry project"
  value       = azurerm_cognitive_account_project.project_primary.id
}

output "deployment_id" {
  description = "ID of the GPT-4.1 deployment"
  value       = azurerm_cognitive_deployment.gpt_4_1.id
}
