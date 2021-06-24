# module in terraform
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf

Name your provider :- terraform-<PROVIDER>-<NAME>
#create SP in azure as contributor to create terraform resourceGroupName
az ad sp create-for-rbac -n "terraform" --role="Contributor" --scopes ="/subscriptions/{subscription-id}"

# terraform init
azure provider is required at the time of init project, values will be given from response of az ad sp.
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

#import existing azure resource in terraform state
terraform import module.mod-rg.azurerm_resource_group.rg /subscriptions/{subscription_id}/resourceGroups/fst-dev-rg
terraform import module.mod-storage.azurerm_storage_account.storage /subscriptions/{subscription_id}/storageAccount/fstdevstorage
terraform import module.mod-appconfig.azurerm_app_configuration.appconf /subscriptions/{subscription_id}/appConfiguration/fst-dev-appconf

# destroy terraform plan and existing resources
terraform plan -destroy
terraform apply -destroy


