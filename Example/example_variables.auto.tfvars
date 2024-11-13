#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Example #{MODULEDISPLAYNAME}# values
#--------------------------------------------------------------
naming_values = {
  region_code     = "uswe2"
  subsc_code      = "714895"
  env             = "dev"
  base_name       = "embergertf"
  additional_name = "#{MODULECODE}#"
  iterator        = "01"
  owner           = "Emm"
  additional_tags = {
    Test_by    = "Emm",
    GitHub_org = "gopher194/embergertf",
    Purpose    = "Terraform modules development"
    Module     = "#{MODULEDISPLAYNAME}#"
  }
}

add_random = null
rnd_length = null

#{MODULECODE}#_additional_tags = {
  Added_by = "#{MODULECODE}#_module_localtest"
}
