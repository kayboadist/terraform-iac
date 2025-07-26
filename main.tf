# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {

  backend "azurerm" {
    resource_group_name   = "terraform-state-rg"
    storage_account_name  = "teststorageinfotitans"
    container_name        = "opstfstate"
    key                   = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  features {}
  subscription_id = "675ec6f5-d0e6-4d1e-a3b5-f9c3f3508ba5"
}
