#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Service Principal required providers and their versions
#--------------------------------------------------------------
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
    azurerm = {
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest
      source  = "hashicorp/azurerm"
      version = "~> 4.7"
    }
  }
}
