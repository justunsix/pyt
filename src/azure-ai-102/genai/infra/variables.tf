variable "location" {
  description = "The name of the location to provision the resources to"
  type        = string
}

variable "subscription_id" {
  description = "ID of Azure subscription to deploy resources to"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "model_name" {
  description = "Name of the model to deploy"
  type        = string
  default     = "gpt-4.1"
}

variable "model_version" {
  description = "Version of the model to deploy"
  type        = string
  default     = "2025-04-14"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

