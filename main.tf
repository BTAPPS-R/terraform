provider "azurerm" {
  features {}

  subscription_id = "b494003c1"
  client_id       = "219e4f55-6f42b03"
  client_secret   = "L8IU~sA7-goXP"
  tenant_id       = "e80326a2-653b-4be1-f6"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.56.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "spn_terraform_rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "storage" {
  name                     = "terraform0spn1storage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}
