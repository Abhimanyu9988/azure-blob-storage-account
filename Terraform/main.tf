terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
     }
  }
}

resource "azurerm_resource_group" "storage-account-rg" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.abhi-storage-account-rg.name
  location                 = azurerm_resource_group.abhi-storage-account-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  static_website {
    index_document = "index.html"
    error_404_document = "404.html"  
  }
}

output "primary_web_endpoint" {
  description = "The primary web endpoint for the static website of the storage account"
  value       = azurerm_storage_account.abhi-storage-account.primary_web_endpoint
}
