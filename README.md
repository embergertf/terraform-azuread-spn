<!-- BEGIN_TF_DOCS -->
# Service Principal module

## Overview

This Service Principal module:

- Creates an Azure AD App registration,
- Creates an Azure AD Service Principal (= Enterprise application),
- Creates an Azure AD App registration secret, if set,
- Creates an Azure AD App registration federated identity credential, if set,
- Stores the App registration secret in a Key Vault secret, if kv\_id is provided.

## Notes

To do equivalent to the command:
`az ad sp create-for-rbac --display-name "sp-with-rbac-test"`

Set the following settings:

```hcl
module "spn_with_secret" {
  # Local use
  source = "../../terraform-azuread-spn"

  # Service Principal settings
  spn_name             = "test-module-w-secret"
  create_client_secret = true
}
```

## Example

```yaml
module "spn_to_kv" {
  # Local use
  source = "../../terraform-azuread-spn"

  # Service Principal settings
  spn_name             = "test-module-to-kv"
  create_client_secret = true
  kv_id                = var.kv_id
  owners               = var.test_owners
}
```

## Documentation
<!-- markdownlint-disable MD033 -->

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.7 |

### Modules

No modules.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_spn_name"></a> [spn\_name](#input\_spn\_name) | (Required) Service Principal name. | `string` | n/a | yes |
| <a name="input_audiences"></a> [audiences](#input\_audiences) | n/a | `list` | `[]` | no |
| <a name="input_create_client_secret"></a> [create\_client\_secret](#input\_create\_client\_secret) | n/a | `bool` | `false` | no |
| <a name="input_create_fedid_cred"></a> [create\_fedid\_cred](#input\_create\_fedid\_cred) | n/a | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `any` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `any` | `null` | no |
| <a name="input_in3yearsUTCFormatted"></a> [in3yearsUTCFormatted](#input\_in3yearsUTCFormatted) | n/a | `any` | `null` | no |
| <a name="input_issuer"></a> [issuer](#input\_issuer) | n/a | `any` | `null` | no |
| <a name="input_kv_id"></a> [kv\_id](#input\_kv\_id) | (Optional) Key vault ID to store the Service Principal information. Example: `/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/kv-name`. | `string` | `null` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | (Optional) List of owners' object IDs. Example: `["00000000-0000-0000-0000-000000000000"]`. | `list(string)` | `[]` | no |
| <a name="input_rotate_sp_secret"></a> [rotate\_sp\_secret](#input\_rotate\_sp\_secret) | n/a | `bool` | `false` | no |
| <a name="input_secret_duration"></a> [secret\_duration](#input\_secret\_duration) | (Optional) The duration for which the secret is valid in hours. Valid format `<num>h`. Default is 26280h (3 years). | `string` | `"26280h"` | no |
| <a name="input_subject"></a> [subject](#input\_subject) | n/a | `any` | `null` | no |

### Resources

| Name | Type |
|------|------|
| [azuread_application.app_registration](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_federated_identity_credential.app_registration_fedid_cred](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential) | resource |
| [azuread_application_password.app_registration_secret](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.azsp_sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_key_vault_secret.app_registration_kv_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_client_id"></a> [app\_client\_id](#output\_app\_client\_id) | App registration Application (client) ID. |
| <a name="output_app_display_name"></a> [app\_display\_name](#output\_app\_display\_name) | App registration display name. |
| <a name="output_app_object_id"></a> [app\_object\_id](#output\_app\_object\_id) | App registration Object ID. |
| <a name="output_app_tf_id"></a> [app\_tf\_id](#output\_app\_tf\_id) | App registration terraform resource ID. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The App Registration Service Principal Object ID. |
| <a name="output_secret_end_date"></a> [secret\_end\_date](#output\_secret\_end\_date) | The secret end date, when secret is created. |
| <a name="output_spn_object_id"></a> [spn\_object\_id](#output\_spn\_object\_id) | The App Registration Service Principal Object ID. |

<!-- END_TF_DOCS -->