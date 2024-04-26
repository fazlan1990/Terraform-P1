terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "Terraform"
    storage_account_name = ""
    container_name       = "tfstatefile"
    key                  = "de.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "811-2420740e-provide-continuous-delivery-with-gith"
  location = "eastus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "faslanstr45"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

