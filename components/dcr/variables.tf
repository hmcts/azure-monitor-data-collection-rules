variable "env" {
  description = "The environment that the resource belongs to."
  type        = string
}

variable "subscription_id" {
  description = "The ID of the subscription in Azure."
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
