# Deploying to Azure with GitHub Actions using OIDC

Secure your Azure deployments from GitHub Actions without storing long-lived secrets by using OpenID Connect (OIDC).

This repository demonstrates how to set up and use OIDC authentication for secure Azure deployments via GitHub Actions.

## Features

- No secrets required for authentication
- Uses short-lived tokens via OIDC
- Automates Azure login and deployment using GitHub Actions

## 📘 Documentation

- [Overview of OIDC](docs/index.md)
- [Setting Up OIDC in Azure](docs/setup-azure.md)
- [GitHub Workflow Example](.github/workflows/deploy.yml)

## 🧪 Prerequisites

- Azure Subscription
- Azure CLI installed
- GitHub repository access

