# Infrastructure for Artificial Intelligence (AI) Azure solutions

Create infrastructure as code (IAC) for the Azure AI-102 lab groups using Terraform.

## Infrastructure Requirements

Resources are shown against the labs requiring the resources by number.

### Requirements for Lab Groups

- Azure Resource Group - hosts all other resources to be created
- Microsoft Foundry
  - Microsoft Foundry resource
  - Microsoft Foundry project
  - Chat model deployment, for example `gpt-4.1`

Recommended region by AI Foundry: `EastUS`, fine tuning lab in [1] may require
`North Central US` or `Sweden Central`.

Foundry resource name usually defaults to `{project_name}-resource`

Content Understanding labs in groups [4,5] require a region supported by
Azure Content Understanding.

### Requirements by Lab Groups

- Microsoft Foundry [1,2,4,5]
  - Chat model deployment such as `gpt-4.1` [1,2,4,5]
  - Image generation model such as `FLUX.1-Kontext-pro` [4]
  - Video generation model such as `Sora-2` [4]
  - Content Understanding auto-deployed models such as `gpt-4.1`,
    `gpt-4.1-mini`, and `text-embedding-3-large` [5]
- Azure AI Language / Foundry Tools [3]
- Azure Translator [3]
- Azure Storage Account [3,4,5]
- Azure AI Search [5]
- Azure AI Services / Document Intelligence [5]

### Labs Groups by Number

1. [Develop generative AI solutions in Azure](https://microsoftlearning.github.io/mslearn-ai-studio/)
2. [Develop AI Agents in Azure](https://microsoftlearning.github.io/mslearn-ai-agents/)
3. [Develop AI Language and Speech solutions on Azure](https://microsoftlearning.github.io/mslearn-ai-language/)
4. [Develop computer vision solutions in Azure](https://microsoftlearning.github.io/mslearn-ai-vision/)
5. [Develop AI-powered information extraction solutions in Azure](https://microsoftlearning.github.io/mslearn-ai-information-extraction/)

Links include lab instructions which may
change has Azure AI services are updated.

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
