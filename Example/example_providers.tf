#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example #{MODULEDISPLAYNAME}# required providers and their versions
#--------------------------------------------------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7"
    }
  }
}
