# Service Principal module

## Overview

This Service Principal module:

- Creates an Azure AD App registration,
- Creates an Azure AD Service Principal (= Enterprise application),
- Creates an Azure AD App registration secret, if set,
- Creates an Azure AD App registration federated identity credential, if set,
- Stores the App registration secret in a Key Vault secret, if kv_id is provided.

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
