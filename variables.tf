#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Service Principal module variables
#--------------------------------------------------------------

# ############################   Dependencies         ############################

# / Key vault ID to store the Service Principal
variable "kv_id" {
  type        = string
  description = "(Optional) Key vault ID to store the Service Principal information. Example: `/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/kv-name`."
  default     = null
}

# ############################   Required Variables   ############################

# None
variable "spn_name" {
  type        = string
  description = "(Required) Service Principal name."
}

# ############################   Optional Variables   ############################

# / Service Principal specific variables
variable "owners" {
  type        = list(string)
  description = "(Optional) List of owners' object IDs. Example: `[\"00000000-0000-0000-0000-000000000000\"]`."
  default     = []
}
variable "create_client_secret" {
  type    = bool
  default = false
}
variable "rotate_sp_secret" {
  type    = bool
  default = false
}
variable "in3yearsUTCFormatted" { default = null }
variable "create_fedid_cred" {
  type    = bool
  default = false
}
variable "secret_duration" {
  type        = string
  description = "(Optional) The duration for which the secret is valid in hours. Valid format `<num>h`. Default is 26280h (3 years)."
  default     = "26280h"
}
variable "display_name" { default = null }
variable "description" { default = null }
variable "audiences" { default = [] }
variable "issuer" { default = null }
variable "subject" { default = null }

# variable "store_az_sp_in_kv" {
#   type    = bool
#   default = false
# }
