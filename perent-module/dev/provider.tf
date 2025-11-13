terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-dhondu"
    storage_account_name = "tfstatesdhondhuwala2025"
    container_name       = "tfstates"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {

  features {}
  subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"

}
