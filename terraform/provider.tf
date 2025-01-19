terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  org_service_url = var.azure_devops_org_service_url
  use_oidc        = true
}