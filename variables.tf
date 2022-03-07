
variable "security_center_subscription_pricing" {
  description = "The pricing tier to use. Possible values are Free and Standard"
  default     = "Standard"
}

variable "security_center_contacts" {
  type        = map(string)
  description = "Manages the subscription's Security Center Contact"
  default     = {}
}

variable "security_center_setting_name" {
  description = "The setting to manage. Possible values are `MCAS` and `WDAT`"
  default     = "MCAS"
}

variable "enable_security_center_setting" {
  description = "Boolean flag to enable/disable data access"
  default     = false
}

variable "enable_security_center_auto_provisioning" {
  description = "Should the security agent be automatically provisioned on Virtual Machines in this subscription?"
  default     = "Off"
}
