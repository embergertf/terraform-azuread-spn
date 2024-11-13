#
# Copyright 2024 Emmanuel Bergerat
#

# Created  on: 2024-11-13
# Created  by: Emmanuel
# Modified on: 
# Modified by: 
# Overview:
#   This Service Principal module:
#   - Creates an Azure AD App registration,
#   - Creates an Azure AD Service Principal (= Enterprise application),
#   - Creates an Azure AD App registration secret, if set,
#   - Stores the App registration secret in a Key Vault secret, if kv_id is provided.
#

# See for API Permissions of the terraform SPN: https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application

#--------------------------------------------------------------
#   Azure Service Principal
#--------------------------------------------------------------
# Terraform Service Principal needs the following permissions to perforn:
#   - To create Entra ID / App registrations.
#     - Microsoft Graph / Application.ReadWrite.OwnedBy
#     - with Admin consent = Yes
#     - be added as an Owner of the App registration it created

#   - To manipulate others App registrations:
#     - Microsoft Graph / Application.ReadWrite.All
#     - with Admin consent = Yes

#   / App registration
resource "azuread_application" "app_registration" {
  display_name = lower("spn-${var.spn_name}")

  owners = concat(
    var.owners,
    [data.azurerm_client_config.current.object_id]
  )
}

#   /  Service Principal (= Enterprise application)
resource "azuread_service_principal" "azsp_sp" {
  client_id                    = azuread_application.app_registration.client_id
  app_role_assignment_required = false
  owners = concat(
    var.owners,
    [data.azurerm_client_config.current.object_id]
  )
}
#*/

#--------------------------------------------------------------
#   Service Principal Certificates & secrets
#--------------------------------------------------------------
#   / Client secret
resource "azuread_application_password" "app_registration_secret" {
  count = var.create_client_secret ? 1 : 0

  display_name   = local.app_secret_suffix
  application_id = azuread_application.app_registration.id
  end_date       = local.secret_end_date_UTCFormatted

  # keepers = { rotateSecret = var.rotate_sp_secret ? var.nowUTCFormatted : false }
  rotate_when_changed = {
    "rotateSecret" = "var.rotate_sp_secret"
  }
  lifecycle { ignore_changes = [end_date] }
}
#   / Federated Identity credential
resource "azuread_application_federated_identity_credential" "app_registration_fedid_cred" {
  count = var.create_fedid_cred ? 1 : 0

  application_id = azuread_application.app_registration.id
  display_name   = var.display_name
  description    = var.description
  audiences      = var.audiences
  issuer         = var.issuer
  subject        = var.subject
}

#--------------------------------------------------------------
#   Service Principal info storage in Key vault
#--------------------------------------------------------------
resource "azurerm_key_vault_secret" "app_registration_kv_secret" {
  count = var.kv_id != null ? 1 : 0

  name         = lower("${azuread_application.app_registration.display_name}")
  key_vault_id = var.kv_id
  # content_type    = azuread_application.app_registration[0].display_name
  expiration_date = var.create_client_secret ? azuread_application_password.app_registration_secret[0].end_date : null

  value = jsonencode({
    "sp-tenantid"                   = data.azurerm_client_config.current.tenant_id,
    "sp-appname"                    = azuread_application.app_registration.display_name,
    "sp-appid"                      = azuread_application.app_registration.client_id,
    "sp-${local.app_secret_suffix}" = var.create_client_secret ? azuread_application_password.app_registration_secret[0].value : "none",
    "sp-objid"                      = azuread_service_principal.azsp_sp.object_id
  })

  tags = merge(local.module_tags, tomap({
    "file-encoding" = "utf-8",
  }))
  lifecycle { ignore_changes = [tags["BuiltOn"], ] }
}
#*/

