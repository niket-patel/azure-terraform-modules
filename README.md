# module in terraform
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf

Name your provider :- terraform-<PROVIDER>-<NAME>

# terraform init
azure provider is required at the time of init.
provider "azurerm"{
    subscription_id=""
    client_id=""
    client_secret=""
    tenanat_id=""
}
# terraform plan -out=tfplan
validate and check resources and store plan into the file.
# terraform apply tfplan
execute .tf scripts and create/update the resources.

#assing value to input variables
terraform apply -var="resourceGroupName=fst-dev-rg" -var="location=eastus"
terraform apply -var-file="terraform.tfvars"
terraform apply -auto-approve

# multiple environment
copy main.tf, terraform.tfvars and variables.tf from dev and copy to sit/uat/prod
terraform.tfvars is environment specific file, it need to be updated the value into it
