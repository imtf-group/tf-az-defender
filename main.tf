#----------------------------------------------------------
# Current Subscription Data Resources
#----------------------------------------------------------

data "azurerm_subscription" "current" {}

#----------------------------------------------------------
# Azure Security Center Workspace Resource
#----------------------------------------------------------

resource "azurerm_security_center_workspace" "main" {
  scope        =  data.azurerm_subscription.current.id 
  workspace_id =  var.log_analytics_workspace_id
}

#----------------------------------------------------------
# Azure Security Center Subscription Pricing Resources
#----------------------------------------------------------

resource "azurerm_security_center_subscription_pricing" "main" {
  tier          = var.security_center_subscription_pricing
  resource_type = var.resource_type
}

#----------------------------------------------------------
# Azure Security Center Contact Resources
#----------------------------------------------------------
resource "azurerm_security_center_contact" "main" {
  email               = lookup(var.security_center_contacts, "email")
  phone               = lookup(var.security_center_contacts, "phone", null)
  alert_notifications = lookup(var.security_center_contacts, "alert_notifications", true)
  alerts_to_admins    = lookup(var.security_center_contacts, "alerts_to_admins", true)
}

resource "azurerm_security_center_setting" "main" {
  count        = var.enable_security_center_setting ? 1 : 0
  setting_name = var.security_center_setting_name
  enabled      = var.enable_security_center_setting
}

resource "azurerm_security_center_auto_provisioning" "main" {
  count          = var.enable_security_center_auto_provisioning == "On" ? 1 : 0
  auto_provision = var.enable_security_center_auto_provisioning
}
