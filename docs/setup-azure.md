# Setting Up OIDC Authentication in Azure

OpenID Connect (OIDC) authentication is a game-changer for securely deploying to Azure from GitHub Actions. It eliminates the need for long-lived secrets, replacing them with short-lived tokens for enhanced security. Let’s walk through the process of setting up OIDC authentication step by step.

## 1. Create Azure AD Application and Service Principal

First, we need to create an Azure AD application and a service principal. These will act as the identity for your GitHub Actions workflows.

```bash
az ad app create --display-name "GitHub-To-Azure-Example" --query appId -o tsv
APP_ID=$(az ad app list --display-name "GitHub-To-Azure-Example" --query [].appId -o tsv)
az ad sp create --id $APP_ID
```

## 2. Configure Federated Identity Credential

Next, we’ll configure a federated identity credential. This allows GitHub Actions to request an ID token from the GitHub OIDC provider and use it to authenticate with Azure.

```bash
az ad app federated-credential create \
  --id $APP_ID \
  --parameters '{
    "name": "github-oidc-branch",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:<OWNER>/<REPO>:ref:refs/heads/main",
    "description": "GitHub Actions OIDC - Branch Workflows (main)",
    "audiences": ["api://AzureADTokenExchange"]
}'
```

> [!NOTE]  
> The subject field can be customized based on your workflow. For example:
>
> For workflows triggered by pull requests: repo:<OWNER>/<REPO>:pull-request
>
> For jobs tied to an environment: repo:<OWNER>/<REPO>:environment:<NAME>
>
> For branch-specific workflows: repo:<OWNER>/<REPO>:ref:<REF_PATH>


## 3. Assign Azure Role to Service Principal

Now, let’s assign the necessary roles to the service principal. In this example, we’ll give it `Reader` access to your Azure subscription.

```bash
az role assignment create --assignee $APP_ID --role Reader --scope /subscriptions/<your-subscription-id>
```

## 4. Collect Secrets

Finally, we’ll collect the required values to set up GitHub secrets for your workflow.

Use these Azure CLI commands to retrieve the values for GitHub secrets:

```bash
AZURE_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
AZURE_TENANT_ID=$(az account show --query tenantId -o tsv)
AZURE_CLIENT_ID=$(az ad sp list --display-name "GitHub-To-Azure-Example" --query [].appId -o tsv)
```

Add these as GitHub secrets:
- AZURE_SUBSCRIPTION_ID
- AZURE_TENANT_ID
- AZURE_CLIENT_ID

To add secrets:

Go to your GitHub repository.
Navigate to Settings > Secrets and variables > Actions.
Click New repository secret and add each secret.