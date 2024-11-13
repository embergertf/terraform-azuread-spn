#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Service Principal variables
#--------------------------------------------------------------



#   / Service Principal specifics
variable "spn_additional_tags" { default = null }
variable "kv_id" { default = null }
variable "test_owners" {
  type        = list(string)
  description = "(Optional) List of owners' object IDs. Example: `[\"00000000-0000-0000-0000-000000000000\"]`."
  default     = []
}
