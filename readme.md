# Workload Federated Identity Demo

This repository contains the code for demonstrating workload federated identity using Azure DevOps and Terraform with OpenID Connect (OIDC) authentication.

## Overview

This demo showcases how to set up and use workload federated identity with Azure DevOps pipelines to securely authenticate with Azure resources using OIDC tokens. The setup includes Terraform configurations and Azure DevOps pipeline definitions.

## Prerequisites

- Azure Subscription
- Azure DevOps account
- Terraform installed locally
- Azure CLI installed locally

## Setup

### 1. Register an Application in Azure AD

1. Go to the [Azure portal](https://portal.azure.com/).
2. Navigate to `Azure Active Directory` > `App registrations` > `New registration`.
3. Fill in the required details and register the application.
4. Note the `Application (client) ID` and `Directory (tenant) ID`.

### 2. Configure the Application for OIDC

1. After registering the application, go to the `Authentication` section.
2. Add a platform configuration (e.g., Web) and set the redirect URIs.
3. Enable ID tokens.

### 3. Create a Service Principal

1. Run the following command to create a service principal:

    ```bash
    az ad sp create-for-rbac --name <service-principal-name> --role contributor --scopes /subscriptions/<subscription-id>
    ```
2. Note the `appId`, `password`, and `tenant`.
    