terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-pod1"
    storage_account_name = "stgdev2025"
    container_name       = "prodterraform"
    key                  = "prod.terraform.tfstate"
  }
}
provider "azurerm" {

  features {}
  subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"

}

