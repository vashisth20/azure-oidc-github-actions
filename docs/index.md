# Overview of OIDC Authentication

OIDC (OpenID Connect) is a modern authentication protocol that allows secure access to Azure from GitHub Actions without storing long-lived secrets.

## Benefits

- 🔐 Enhanced Security
- 🧼 No Secrets Management
- 🔄 Automatically issued short-lived tokens

GitHub Actions can request an ID token from the GitHub OIDC provider and present it to Azure for login.

