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
  resource_group_name      = azurerm_resource_group.storage-account-rg.name
  location                 = azurerm_resource_group.storage-account-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  static_website {
    index_document = "index.html"
    error_404_document = "404.html"  
  }
}

resource "azurerm_storage_management_policy" "lifecycly-management-policy"{
  storage_account_id = azurerm_storage_account.storage-account.id
  rule {
    name    = "MoveToCoolStorageAfter30Days"
    enabled = true
    filters {
      prefix_match = [""]  # Apply to all blobs
      blob_types   = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 30
      }
    }
  }
}


output "primary_web_endpoint" {
  description = "The primary web endpoint for the static website of the storage account"
  value       = azurerm_storage_account.storage-account.primary_web_endpoint
}
