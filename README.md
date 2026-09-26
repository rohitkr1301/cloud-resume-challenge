# Azure Cloud Resume Challenge

A cloud-hosted resume built on Azure to demonstrate hands-on experience with
infrastructure as code, serverless computing, databases, networking, identity,
GitHub Actions and automated deployment.

🌐 Live site: https://resume.rohitkumar.design

## Architecture

Frontend
- HTML / CSS / JavaScript
- Azure Blob Storage static website
- Cloudflare DNS, CDN and HTTPS

Backend
- Azure Functions
- Python
- Azure Cosmos DB

Infrastructure
- Terraform
- AzureRM
- Remote Terraform state in Azure Storage
- Entra ID / RBAC authentication

CI/CD
- GitHub Actions

## Project Status

| Component | Status |
|---|---|
| Static resume website |Complete |
| Custom domain / HTTPS |Complete |
| Visitor counter API |Complete |
| Cosmos DB integration |Complete |
| Terraform infrastructure |Complete |
| Remote Terraform state |Complete |
| Python automated tests |In progress |
| GitHub Actions CI |In progress |
| Automated Azure deployment |In progress |
| DEV / PROD environments |Planned |
| Terraform Cloudflare DNS |Planned |

## Current CI Pipeline

Push to main
→ GitHub Actions
→ Checkout repository
→ Configure Python 3.12
→ Install dependencies
→ [pytest in progress]
→ [Azure deployment in progress]

## What I Learned

- Importing existing Azure resources into Terraform
- Terraform state and remote backends
- Azure management plane vs data plane
- Entra ID and RBAC
- Azure Functions and Cosmos DB
- Static website hosting
- DNS and HTTPS
- Git and GitHub
- GitHub Actions CI/CD

## Roadmap

- Add pytest unit tests
- Add CI test gate
- Configure GitHub → Azure OIDC authentication
- Automatically deploy Azure Function
- Automatically deploy frontend
- Add Terraform validation / plan pipeline
- Create separate DEV and PROD environments
- Move Cosmos authentication from key-based auth to managed identity

## Engineering Decisions

### Azure Blob Storage instead of Static Web Apps
I chose Blob Storage static website hosting to learn the underlying Azure
storage, CDN/DNS and infrastructure components rather than abstracting them
behind Static Web Apps.

### Terraform remote state
Terraform state is stored in a dedicated Azure Storage account with blob
versioning and soft-delete enabled.

### Separate bootstrap infrastructure
The Terraform backend is created through a separate bootstrap Terraform
project to avoid the state-backend dependency problem.

### GitHub OIDC
The CI/CD pipeline is being designed to authenticate to Azure through
federated identity rather than storing long-lived Azure client secrets.