terraform init --var-file=terraform.tfvars
terraform apply --var-file=terraform.tfvars

export AZDO_ORG_SERVICE_URL="https://dev.azure.com/your-organization"
export AZDO_PERSONAL_ACCESS_TOKEN="your-personal-access-token"