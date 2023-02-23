# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

# Generate a random string to create a globally unique name
resource "random_string" "rs" {
  length = 16
  special = false
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "fiap-${random_string.rs.result}"
  location = var.location
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-fiap-${random_string.rs.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "exercicio-04-${random_string.rs.result}"
  resource_group_name = azurerm_service_plan.appserviceplan.resource_group_name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }
  }
}

resource "azurerm_linux_web_app_slot" "webapp" {
  name           = "dark-mode"
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }
  }
}