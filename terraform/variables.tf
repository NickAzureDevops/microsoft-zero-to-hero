variable "name" { 
}

variable "location" {
  type = string
}

variable "project_name" {
  type = string 
}

variable "azure_devops_org_service_url" {
  type = string
}

variable "azure_devops_pat" {
  type = string 
  sensitive = true
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}