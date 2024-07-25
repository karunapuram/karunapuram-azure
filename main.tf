provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "eastus"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacc${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "example" {
  name                       = "example-functionapp"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  version                    = "~3"
  https_only                 = true

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}

provider "random" {
  version = ">= 2.1.0"
}
