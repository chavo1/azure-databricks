terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}
###################################
# Azure provider with Credentials #
###################################
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}
########################################
# Databricks provider with Credentials #
#     Use Azure CLI authentication     #
########################################
provider "databricks" {
  host                        = "https://${azurerm_databricks_workspace.this.workspace_url}/"
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  auth_type                   = "azure-cli"
}