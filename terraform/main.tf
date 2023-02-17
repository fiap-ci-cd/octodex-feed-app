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

data "external" "existing_resource_group" {
    program = ["/bin/bash","./exist_resource.sh"]

    query = {
        group_name = var.resource_group_name
    }
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  count    = data.external.existing_resource_group.result.exists == "true" ? 0 : 1
  name     = var.resource_group_name
  location = "eastus"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }
    # zip_deploy_file = "../app.zip"
  }
}

resource "azurerm_linux_web_app_slot" "webapp" {
  name           = "dark-mode"
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    # zip_deploy_file = "../app.zip"
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}