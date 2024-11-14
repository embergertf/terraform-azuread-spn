#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Service Principal module locals
#--------------------------------------------------------------
# / locals group 1
locals {
  module_tags = merge(var.additional_tags, tomap({
    "file-encoding" = "utf-8",
    "TfModule"      = "embergertf/spn",
  }))

  app_secret_suffix = "secret1"

  # / Secret end date
  now                          = timestamp() # in UTC
  secret_end_date_UTC          = timeadd(local.now, "26280h")
  secret_end_date_UTCFormatted = "${formatdate("YYYY-MM-DD", local.secret_end_date_UTC)}T${formatdate("hh:mm:ss", local.secret_end_date_UTC)}Z" # "2029-01-01T01:01:01Z"
}
