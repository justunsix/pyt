# Infrastructure as Code for Develop Artificial Intelligence (AI) solutions in Azure AI-102 Labs

Create infrastructure for the
[Develop generative AI solutions in Azure](https://github.com/MicrosoftLearning/mslearn-ai-studio)
labs using Terraform.

## Infrastructure Requirements

- Azure Resource Group - hosts all other resources to be created

### Other Requirements Depending on Lab Area

- Microsoft Foundry
  - Microsoft Foundry project - named as {project_name}-resource
  - Model

Recommended region by AI Foundry: `EastUS`, fine tuning lab may require
`North Central US` or `Sweden Central`.

## Usage

Follow README at
[microsoft-foundry/foundry-samples on GitHub Basic Deployment Template](https://github.com/microsoft-foundry/foundry-samples/blob/main/infrastructure/infrastructure-setup-terraform/00-basic-azurerm/README.md).
The Terraform files in this folder use the template in that foundry-samples
repository.

- See [`Makefile`](Makefile) or [`mise.toml`](mise.toml) for commands in sequence
- Set `TF_VAR_subscription_id="YOUR_SUBSCRIPTION_ID"` in shell
- Set variables in the `terraform.tfvars` file

## See Also

- [Azure AI Foundry - Azure Terraform Quickstart - GitHub](https://github.com/Azure/terraform/tree/master/quickstart/101-azure-ai-foundry)
- [Use Terraform to create Azure AI Foundry resource](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/create-resource-terraform)
- [Azure OpenAI - Terraform Registry](https://registry.terraform.io/modules/Azure/openai/azurerm/latest?tab=resources)
