# Setting Up OIDC Authentication in Azure

## 1. Create Azure AD Application and Service Principal

```bash
az ad app create --display-name "GitHub-To-Azure-Example" --query appId -o tsv
APP_ID=$(az ad app list --display-name "GitHub-To-Azure-Example" --query [].appId -o tsv)
az ad sp create --id $APP_ID
```

## 2. Configure Federated Identity Credential

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

## 3. Assign Azure Role to Service Principal

```bash
az role assignment create --assignee $APP_ID --role Reader --scope /subscriptions/<your-subscription-id>
```

## 4. Collect Secrets

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
