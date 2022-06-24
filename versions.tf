terraform {
  required_version = "~>1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3"
    }
  }
}
provider "azurerm" {
  use_oidc = true
  features {}
}
