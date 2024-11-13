#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Service Principal outputs
#--------------------------------------------------------------

# ############################   Service Principal   ############################
# / spn_default
output "spn_default_app_display_name" {
  value       = module.spn_default.app_display_name
  description = "App registration display name."
}
output "spn_default_app_client_id" {
  value       = module.spn_default.app_client_id
  description = "App registration Application ID."
}
output "spn_default_app_object_id" {
  value       = module.spn_default.app_object_id
  description = "App registration Object ID."
}

# / spn_with_secret
output "spn_with_secret_app_display_name" {
  value       = module.spn_with_secret.app_display_name
  description = "App registration display name."
}
output "spn_with_secret_app_client_id" {
  value       = module.spn_with_secret.app_client_id
  description = "App registration Application ID."
}
output "spn_with_secret_app_object_id" {
  value       = module.spn_with_secret.app_object_id
  description = "App registration Object ID."
}
output "spn_with_secret_secret_end_date" {
  value       = module.spn_with_secret.secret_end_date
  description = "Secret End date."
}
output "spn_with_secret_app_principal_id" {
  value       = module.spn_with_secret.principal_id
  description = "App registration Service Principal (Enterprise app) Object ID."
}

# / spn_to_kv
output "spn_to_kv_app_display_name" {
  value       = module.spn_to_kv.app_display_name
  description = "App registration display name."
}
output "spn_to_kv_app_client_id" {
  value       = module.spn_to_kv.app_client_id
  description = "App registration Application ID."
}
output "spn_to_kv_app_object_id" {
  value       = module.spn_to_kv.app_object_id
  description = "App registration Object ID."
}

/*
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
