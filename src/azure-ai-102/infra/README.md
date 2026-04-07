# Infrastructure as Code for Develop Artificial Intelligence (AI) solutions in Azure AI-102 Labs

Create infrastructure for the
[Develop generative AI solutions in Azure](https://github.com/MicrosoftLearning/mslearn-ai-studio)
labs using Terraform.

## Infrastructure Requirements

Resources are shown against the labs requiring the resources by number.

### Requirements for all Labs

- Azure Resource Group - hosts all other resources to be created
- Microsoft Foundry
  - Microsoft Foundry project - named as {project_name}-resource
  - Model, for example `gpt-4.1`
  
Recommended region by AI Foundry: `EastUS`, fine tuning lab may require
`North Central US` or `Sweden Central`.
  
### Requirements by Lab Groups

- Microsoft Foundry [1,2]
  - Azure Language in Foundry Tools [3]
  - Azure Translator - Text translation [3]
- Azure Storage Account [3]

### Labs Groups by Number

1. [Develop generative AI solutions in Azure](https://microsoftlearning.github.io/mslearn-ai-studio/)
2. [Develop AI Agents in Azure](https://microsoftlearning.github.io/mslearn-ai-agents/)
3. [Develop AI Language and Speech solutions on Azure](https://microsoftlearning.github.io/mslearn-ai-language/)
TODO: 
4. [Develop computer vision solutions in Azure](microsoftlearning.github.io/mslearn-ai-vision/)
5. [Develop AI-powered information extraction solutions in Azure](microsoftlearning.github.io/mslearn-ai-information-extraction/)

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
