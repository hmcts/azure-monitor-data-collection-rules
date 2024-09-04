data "azurerm_resource_group" "log_analytics_rg" {
  name = "oms-automation"
}

data "azurerm_log_analytics_workspace" "workspace" {
  name                = local.log_analytics_workspace
  resource_group_name = data.azurerm_resource_group.log_analytics_rg.name
}
