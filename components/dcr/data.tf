data "azurerm_resource_group" "log_analytics_rg" {
  provider = azurerm.log_analytics
  name     = "oms-automation"
}

data "azurerm_log_analytics_workspace" "workspace" {
  provider            = azurerm.log_analytics
  name                = local.log_analytics_workspace
  resource_group_name = data.azurerm_resource_group.log_analytics_rg.name
}
