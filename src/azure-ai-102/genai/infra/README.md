# Infrastructure as Code for GenAI Labs

Create infrastructure for the
[Develop generative AI solutions in Azure](https://github.com/MicrosoftLearning/mslearn-ai-studio)
labs using Terraform.

## Infrastructure Requirements

- Azure Resource Group - hosts all other resources to be created
- Microsoft Foundry
- Microsoft Foundry project - named as {project_name}-resource

Recommended region by AI Foundry: `EastUS`, fine tuning lab may require
`North Central US` or `Sweden Central`.

### Other Optional resources

- Microsoft Foundry, deployed model `gpt-4-1`

## Usage

Follow README at
[microsoft-foundry/foundry-samples on GitHub Basic Deployment Template](https://github.com/microsoft-foundry/foundry-samples/blob/main/infrastructure/infrastructure-setup-terraform/00-basic-azurerm/README.md).
The Terraform files in this folder use the template in that foundry-samples
repository.

In summary, see [`Makefile`](Makefile) for commands in sequence and set
`TF_VAR_subscription_id="YOUR_SUBSCRIPTION_ID"` in shell and variables in the `.tf`
files.

## See Also

- [Azure AI Foundry - Azure Terraform Quickstart - GitHub](https://github.com/Azure/terraform/tree/master/quickstart/101-azure-ai-foundry)
- [Use Terraform to create Azure AI Foundry resource](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/create-resource-terraform)
- [Azure OpenAI - Terraform Registry](https://registry.terraform.io/modules/Azure/openai/azurerm/latest?tab=resources)