# Setup providers
provider "azurerm" {
  features {
    resource_group {
      # Allow delection of resources in group outside of Terraform
      prevent_deletion_if_contains_resources = false
    }
  }
  storage_use_azuread = true
  subscription_id     = var.subscription_id
}
