terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
   cloud {
    organization = "fas-org1"

    workspaces {
      name = "TerraformP1"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "811-d06e33db-provide-continuous-delivery-with-gith"
  location = "westus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "faslanstr45"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

