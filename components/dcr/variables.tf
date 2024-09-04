variable "env" {
  description = "The environment that the resource belongs to."
  type        = string
}

variable "product" {
  description = "The product that the resource belongs to."
  type        = string
  default     = "mgmt"
}

variable "location" {
  description = "The region in Azure that the resource will be deployed to."
  type        = string
  default     = "UK South"
}

variable "builtFrom" {
  type        = string
  description = "Repo the resources are built from!"
  default     = "hmcts/azure-monitor-data-collection-rules"
}

variable "log_analytics_sub_id" {
  description = "The subscription ID of the Log Analytics Workspace."
  type        = string
  default     = "bf308a5c-0624-4334-8ff8-8dca9fd43783" # hmcts-sandbox
}
