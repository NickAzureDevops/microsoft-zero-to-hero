data "azurerm_client_config" "current" {}

data "azuredevops_project" "project" {
  name = var.project_name
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name}"
  location = var.location
}

resource "azurerm_user_assigned_identity" "ui" {
  location            = var.location
  name                = "user-identity-${var.name}-dev"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azuredevops_serviceendpoint_azurerm" "endpoint" {
  project_id                             = data.azuredevops_project.project.id
  service_endpoint_name                  = "service-endpoint-${var.name}"
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azurerm_user_assigned_identity.ui.client_id
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = "MVP MSDN Subscription"
}

resource "azurerm_federated_identity_credential" "federated_identity" {
  name                = "example-federated-credential"
  resource_group_name = azurerm_resource_group.rg.name
  parent_id           = azurerm_user_assigned_identity.ui.id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azuredevops_serviceendpoint_azurerm.endpoint.workload_identity_federation_issuer
  subject             = azuredevops_serviceendpoint_azurerm.endpoint.workload_identity_federation_subject
}