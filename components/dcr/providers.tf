terraform {
  required_version = ">= 1.7.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.1"
    }
  }
}

provider "azurerm" {
  # alias = "log_analytics"
  features {}
  # subscription_id = var.log_analytics_sub_id
}
