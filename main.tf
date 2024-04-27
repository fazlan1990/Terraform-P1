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
    storage_account_name = "terraformfas2"
    container_name       = "tfstatefile"
    key                  = "de.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "null_resource" "az_login" {
  provisioner "local-exec" {
    command = "az login --tenant 30fe8ff1-adc6-444d-ba94-1238894df42c -u kk_lab_user_main-b911665b0069409b@azurekmlprodkodekloud.onmicrosoft.com -p pJm4^qSdAcUw4Rog"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "kml_rg_main-b911665b0069409b"
  location = "West US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "faslanstra45"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
