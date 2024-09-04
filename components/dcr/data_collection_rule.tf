resource "azurerm_monitor_data_collection_rule" "windows_data_collection_rule" {
  name                = "ama-windows-vm-logs"
  resource_group_name = data.azurerm_log_analytics_workspace.workspace.resource_group_name
  location            = var.location
  kind                = "Windows"
  description         = "A data collection rule for collecting Windows event logs and sending them to the appropriate log analytics workspace."

  destinations {
    log_analytics {
      workspace_resource_id = data.azurerm_log_analytics_workspace.workspace.id
      name                  = local.log_analytics_workspace
    }
  }

  data_flow {
    streams      = ["Microsoft-WindowsEvent"]
    destinations = [local.log_analytics_workspace]
  }

  data_flow {
    streams      = ["Microsoft-Event"]
    destinations = [local.log_analytics_workspace]
  }

  data_flow {
    streams      = ["Microsoft-SecurityEvent"]
    destinations = [local.log_analytics_workspace]
  }

  data_sources {
    windows_event_log {
      streams        = ["Microsoft-WindowsEvent"]
      x_path_queries = ["Application!*[System[(Level = 1 or Level = 2 or Level = 3)]]", "System!*[System[(Level = 1 or Level = 2 or Level = 3)]]"]
      name           = "ms-windows-event-log"
    }

    windows_event_log {
      streams        = ["Microsoft-Event"]
      x_path_queries = ["Application!*[System[(Level = 1 or Level = 2 or Level = 3)]]", "System!*[System[(Level = 1 or Level = 2 or Level = 3)]]"]
      name           = "ms-event-log"
    }

    windows_event_log {
      streams        = ["Microsoft-SecurityEvent"]
      x_path_queries = ["Application!*[System[(Level = 1 or Level = 2 or Level = 3)]]", "System!*[System[(Level = 1 or Level = 2 or Level = 3)]]"]
      name           = "ms-security-event-log"
    }
  }
}

resource "azurerm_monitor_data_collection_rule" "linux_data_collection_rule" {
  name                = "ama-linux-vm-logs"
  resource_group_name = data.azurerm_log_analytics_workspace.workspace.resource_group_name
  location            = var.location
  kind                = "Linux"
  description         = "A data collection rule for collecting Linux syslog and performance counters and sending them to the appropriate log analytics workspace."

  destinations {
    log_analytics {
      workspace_resource_id = data.azurerm_log_analytics_workspace.workspace.id
      name                  = local.log_analytics_workspace
    }
  }

  data_flow {
    streams      = ["Microsoft-Perf"]
    destinations = [local.log_analytics_workspace]
  }

  data_flow {
    streams      = ["Microsoft-Syslog"]
    destinations = [local.log_analytics_workspace]
  }

  data_sources {
    performance_counter {
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 300
      counter_specifiers            = ["% Used Inodes", "% Used Space", "Disk Reads/sec", "Disk Transfers/sec", "Disk Writes/sec", "Free Megabytes"]
      name                          = "ms-performance"
    }

    syslog {
      facility_names = ["auth", "cron", "daemon", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "user"]
      log_levels     = ["Emergency", "Alert", "Critical", "Error"]
      streams        = ["Microsoft-Syslog"]
      name           = "ms-syslog-error"
    }

    syslog {
      facility_names = ["syslog"]
      log_levels     = ["Emergency", "Alert", "Critical", "Error", "Warning", "Notice", "Info"]
      streams        = ["Microsoft-Syslog"]
      name           = "ms-syslog-info"
    }
  }
}
