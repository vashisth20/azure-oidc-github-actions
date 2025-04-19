# Deploying to Azure with GitHub Actions using OIDC

Secure your Azure deployments from GitHub Actions without storing long-lived secrets by using OpenID Connect (OIDC).

OpenID Connect (OIDC) authentication is a modern and secure way to deploy to Azure from GitHub Actions without storing long-lived secrets. This repository demonstrates how to set up and use OIDC for secure Azure deployments.

## Features

- 🔐 **No Secrets Required**: Authenticate without storing sensitive credentials.
- 🧼 **Simplified Management**: Uses short-lived tokens for enhanced security.
- 🚀 **Automated Workflows**: Seamlessly integrate Azure login and deployment into your CI/CD pipeline.

## 📘 Documentation

- [Overview of OIDC](docs/overview-oidc.md.md)
- [Setting Up OIDC in Azure](docs/setup-azure.md)
- [GitHub Workflow Example](.github/workflows/deploy.yml)

## 🧪 Prerequisites

- An active Azure Subscription
- Azure CLI installed and logged in
- A GitHub repository with Actions enabled

## 🚀 Getting Started

1. Follow the [Setup Guide](docs/setup-azure.md) to configure OIDC in Azure.
2. Use the provided [GitHub Workflow Example](.github/workflows/deploy.yml) to deploy resources securely.
3. Enjoy secure and seamless deployments to Azure!