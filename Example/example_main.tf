#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example Service Principal main
#--------------------------------------------------------------
#   / Service Principal module tests
module "spn_default" {
  # Local use
  source = "../../terraform-azuread-spn"

  # Service Principal settings
  spn_name = "test-module-default"
  owners   = var.test_owners
}

module "spn_with_secret" {
  # Local use
  source = "../../terraform-azuread-spn"

  # Service Principal settings
  spn_name             = "test-module-w-secret"
  create_client_secret = true
  owners               = var.test_owners
}

module "spn_to_kv" {
  # Local use
  source = "../../terraform-azuread-spn"

  # Service Principal settings
  spn_name             = "test-module-to-kv"
  create_client_secret = true
  kv_id                = var.kv_id
  owners               = var.test_owners
}
#*/
