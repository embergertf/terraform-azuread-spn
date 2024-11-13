#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Service Principal module outputs
#--------------------------------------------------------------

# ############################   Application Registration   ############################
output "app_display_name" {
  value       = azuread_application.app_registration.display_name
  description = "App registration display name."
}
output "app_client_id" {
  value       = azuread_application.app_registration.client_id
  description = "App registration Application (client) ID."
}
output "app_tf_id" {
  value       = azuread_application.app_registration.id
  description = "App registration terraform resource ID."
}
output "app_object_id" {
  value       = azuread_application.app_registration.object_id
  description = "App registration Object ID."
}
output "secret_end_date" {
  value       = local.secret_end_date_UTCFormatted
  description = "The secret end date, when secret is created."
}
output "spn_object_id" {
  value       = azuread_service_principal.azsp_sp.object_id
  description = "The App Registration Service Principal Object ID."
}
output "principal_id" {
  value       = azuread_service_principal.azsp_sp.object_id
  description = "The App Registration Service Principal Object ID."
}
#*/
