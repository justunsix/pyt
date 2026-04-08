variable "location" {
  description = "The name of the location to provision the resources to"
  type        = string
  default     = "eastus2"
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

variable "chat_model_name" {
  description = "Name of the chat model to deploy"
  type        = string
  default     = "gpt-4.1"
}

variable "chat_model_version" {
  description = "Version of the chat model to deploy"
  type        = string
  default     = "2025-04-14"
}

variable "image_model_name" {
  description = "Name of the image model to deploy"
  type        = string
  default     = "FLUX.1-Kontext-pro"
}

variable "image_model_version" {
  description = "Version of the image model to deploy"
  type        = string
  default     = "1"
}

variable "video_model_name" {
  description = "Name of the video model to deploy"
  type        = string
  default     = "Sora-2"
}

variable "video_model_version" {
  description = "Version of the video model to deploy"
  type        = string
  default     = "1"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "create_ai_foundry" {
  description = "Create AI Foundry cognitive account"
  type        = bool
  default     = false
}

variable "create_project" {
  description = "Create Foundry project"
  type        = bool
  default     = false
}

variable "create_chat_model_deployment" {
  description = "Deploy chat model to AI Foundry"
  type        = bool
  default     = false
}

variable "create_image_model_deployment" {
  description = "Deploy image generation model to AI Foundry"
  type        = bool
  default     = false
}

variable "create_video_model_deployment" {
  description = "Deploy video generation model to AI Foundry"
  type        = bool
  default     = false
}

variable "create_storage_account" {
  description = "Create a storage account"
  type        = bool
  default     = false
}

variable "create_ai_language" {
  description = "Create Azure AI Language account"
  type        = bool
  default     = false
}

variable "create_translator" {
  description = "Create Azure Translator account"
  type        = bool
  default     = false
}

variable "create_ai_search" {
  description = "Create Azure AI Search service"
  type        = bool
  default     = false
}

variable "create_document_intelligence" {
  description = "Create Azure AI Document Intelligence account"
  type        = bool
  default     = false
}

