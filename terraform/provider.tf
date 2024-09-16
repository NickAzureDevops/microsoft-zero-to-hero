terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">= 0.9.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id

}

provider "azuredevops" {
  org_service_url       = var.azure_devops_org_service_url
  use_oidc              = true
}