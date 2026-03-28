variable "location" {
  description = "The name of the location to provision the resources to"
  type        = string
}

variable "subscription_id" {
  description = "ID of Azure subscription to deploy resources to"
  type        = string
  sensitive   = true
}

