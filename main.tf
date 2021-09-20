terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.76"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-iog-sandbox-eastus2-lnriskio"
    storage_account_name = "cs710032000e5af1fef"
    container_name       = "marksak"
    key                  = "marksak.tfstate"
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "eastus2"
}

resource "azurerm_virtual_network" "lab" {
  name                = "aztf-labs-vnet"
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = {
    Environment = "Lab"
    Project     = "AZTF Training"
  }
}
