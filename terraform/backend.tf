terraform {
    backend "azurerm" {
    use_azuread_auth = true
      storage_account_name = "stterraformbootstrap001"
      container_name = "tfstate"
      key = "cloud-resume-dev.tfstate"
    }

}