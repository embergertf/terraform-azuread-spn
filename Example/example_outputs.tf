#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example #{MODULEDISPLAYNAME}# outputs
#--------------------------------------------------------------

# ############################   #{MODULEDISPLAYNAME}#   ############################
output "#{MODULECODE}#_name" {
  value       = module.#{MODULECODE}#_module_localtest.name
  description = "#{MODULEDISPLAYNAME}# name."
}
output "#{MODULECODE}#_location" {
  value       = module.#{MODULECODE}#_module_localtest.location
  description = "#{MODULEDISPLAYNAME}# location."
}
output "#{MODULECODE}#_random_suffix" {
  value       = module.#{MODULECODE}#_module_localtest.random_suffix
  description = "Randomized piece of the #{MODULEDISPLAYNAME}# name when \"`add_random = true`\"."
}
output "#{MODULECODE}#_tags" {
  value       = module.#{MODULECODE}#_module_localtest.tags
  description = "#{MODULEDISPLAYNAME}# tags."
}

# ############################   DEBUG                ############################
output "var_naming_values" {
  value       = var.naming_values
  description = "Naming values."
}
output "rg_name" {
  value       = module.rg.name
  description = "Resource Group name."
}
output "rg_location" {
  value       = module.rg.location
  description = "Resource Group location."
}
output "rg_random_suffix" {
  value       = module.rg.random_suffix
  description = "Randomized piece of the Resource Group name when \"`add_random = true`\"."
}
output "rg_tags" {
  value       = module.rg.tags
  description = "Resource Group tags."
}
#*/
