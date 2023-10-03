# Azure Static Website Deployment with Terraform

This repository provides Terraform configurations to deploy an Azure Storage Account with static website hosting. The website displays a simple "Hello World!" message, and there's a custom 404 page for any unmatched routes.


## Website Content

### Main Page (`index.html`)

A straightforward "Hello World!" webpage designed with center alignment and a neutral background.

### Terraform folder

The folder contains configuration files to deploy Storage account to Azure

### Error page (`404.html`)

The page for 404

## Features

- 📦 **Azure Storage Account**: Utilizes the modern StorageV2 account type, optimal for hosting static web content.
- 🌐 **Static Web Hosting**: Configured with `index.html` for primary content and a dedicated `404.html` for error routing.
- 🛠️ **Terraform Configuration**: 
  - Resource Group Setup: Efficient creation of the Azure resource group.
  - Primary Web Endpoint: Access the static website after deployment using the provided primary web endpoint.

## Deployment

1. **Initialize**:
   Navigate to the `terraform` directory and run:
   ```bash
   terraform init



