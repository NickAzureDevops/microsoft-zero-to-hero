variable "name" { 
  type = string
  description = "The name of the azure resources"
}

variable "location" {
  type = string
  description = "The location/region where the resources will be created"
}

variable "azure_devops_org_service_url" {
  type        = string
  description = "The Azure DevOps organization service URL"
}

variable "project_name" {
  description = "The name of the Azure DevOps project"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type = string
}