#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   #{MODULEDISPLAYNAME}# module outputs
#--------------------------------------------------------------

# ############################   #{MODULEDISPLAYNAME}#   ############################
output "name" {
  value       = azurerm_xxx_yyy.this.name
  description = "#{MODULEDISPLAYNAME}# name."
}
output "id" {
  value       = azurerm_xxx_yyy.this.id
  description = "#{MODULEDISPLAYNAME}# ID."
}
output "location" {
  value       = azurerm_xxx_yyy.this.location
  description = "#{MODULEDISPLAYNAME}# location."
}
output "resource_group_name" {
  value       = azurerm_xxx_yyy.this.resource_group_name
  description = "#{MODULEDISPLAYNAME}# Resource group name."
}

/*
# ############################   Debug                ############################
output "name" {
  value       = module.#{MODULECODE}#_base.name
  description = "#{MODULEDISPLAYNAME}# name."
}
output "location" {
  value       = module.#{MODULECODE}#_base.location
  description = "#{MODULEDISPLAYNAME}# location."
}
output "random_suffix" {
  value       = module.#{MODULECODE}#_base.random_suffix
  description = "Randomized piece of the #{MODULEDISPLAYNAME}# name when \"`add_random = true`\"."
}
output "naming_module_tags" {
  value       = module.#{MODULECODE}#_base.tags
  description = "Naming module tags."
}
#*/
