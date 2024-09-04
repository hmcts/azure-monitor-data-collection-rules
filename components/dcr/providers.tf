terraform {
  required_version = ">= 1.7.5"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.log_analytics_sub_id

}
