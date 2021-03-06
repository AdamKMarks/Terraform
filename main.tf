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

locals {
  region = "eastus2"
  common_tags = {
    Environment = "Lab"
    Project     = "AZTF Training"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = local.region
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "lab" {
  name                = "aztf-labs-vnet"
  location            = local.region
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "lab-public" {
  name                 = "aztf-labs-subnet-public"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.lab.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "lab-private" {
  name                 = "aztf-labs-subnet-private"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.lab.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "lab-public" {
  name                = "aztf-labs-public-sg"
  location            = local.region
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "lab-public" {
  subnet_id                 = azurerm_subnet.lab-public.id
  network_security_group_id = azurerm_network_security_group.lab-public.id
}
