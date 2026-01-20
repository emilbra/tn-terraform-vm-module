# About this repo

This repo contains a terraform module for creating Azure Virtual Machines.

To use this, call this module using a module block like this:

```tf
module "azure_vm" {
  source = git::https://github.com/emilbra/tn-terraform-vm-module.git?ref=v1.0.0
  # Add module input variables here
}
```

# Auto-generated Terraform docs
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | What location to use for the Azure Resources | `string` | `"norwayeast"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
