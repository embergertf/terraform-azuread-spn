#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example #{MODULEDISPLAYNAME}# main
#--------------------------------------------------------------
#   / Resource Group
module "rg" {
  # Terraform Cloud use
  source  = "app.terraform.io/embergertf/resourcegroup/azurerm"
  version = "~> 2.1"

  # Name override
  # name_override = var.name_override

  # Naming convention
  naming_values = var.naming_values
  # region_code     = var.region_code
  # subsc_code      = var.subsc_code
  # env             = var.env
  # base_name       = var.base_name
  # additional_name = var.additional_name
  # iterator        = var.iterator
  # owner           = var.owner

  # # Random
  # add_random = var.add_random
  # rnd_length = var.rnd_length

  # additional_tags = null
}


#   / #{MODULEDISPLAYNAME}# module tests
module "#{MODULECODE}#_module_localtest" {
  # Local use
  source = "../../terraform-azurerm-#{MODULECODE}#"

  # Naming convention
  naming_values = module.rg.naming_values

  # #{MODULEDISPLAYNAME}# settings
  resource_group_name = module.rg.resource_group_name

  additional_tags = var.#{MODULECODE}#_additional_tags
}
