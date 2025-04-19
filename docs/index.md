# Overview of OIDC Authentication

OIDC (OpenID Connect) is a modern authentication protocol that allows secure access to Azure from GitHub Actions without storing long-lived secrets.

## Benefits

- 🔐 **Enhanced Security**: Eliminates the need for long-lived secrets.
- 🧼 **Simplified Management**: Uses short-lived tokens that are automatically issued.
- 🚀 **Seamless Integration**: Works natively with GitHub Actions and Azure.

## How It Works

GitHub Actions can request an ID token from the GitHub OIDC provider and present it to Azure for authentication. This token is short-lived and scoped to the specific workflow, ensuring secure and granular access control.

---

## Next Steps

- [Set Up OIDC in Azure](setup-azure.md)
- [Example GitHub Workflow](../.github/workflows/deploy.yml)