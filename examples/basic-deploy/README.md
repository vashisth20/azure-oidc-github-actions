# Example: Basic Deployment with OIDC

This example uses a simple Bicep file to deploy a Storage Account to Azure using GitHub Actions with OIDC authentication.

## Prerequisites
- Azure CLI installed and logged in.
- A GitHub repository with Actions enabled.
- OIDC authentication set up in Azure. See [Setting Up OIDC in Azure](../../docs/setup-azure.md).

## Steps to Deploy
1. Clone this repository.
2. Navigate to the `examples/basic-deploy` directory.
3. Run the Bicep file locally (optional):
   ```bash
   az deployment group create --resource-group <RESOURCE_GROUP> --template-file main.bicep