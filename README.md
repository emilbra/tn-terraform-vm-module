# About this repo

This repo contains a terraform module for creating Azure Virtual Machines.

To use this, call this module using a module block like this:

```tf
module "azure_vm" {
  source = git::https://github.com/emilbra/tn-terraform-vm-module.git?ref=v1.0.0
  # Add module input variables here
}
```

## About naming of resources and variables

Where possible, I tend to use the naming standard defined by Azure CAF, as it is recognizable by a lot of engineers out there.
For variables, I am not that opinonated, but one should avoid abbreviations.

For this module the naming for the resources themselves is like this:

<resource_type>-<location_shorthand>-<project>-<environment>-<running-number>
For example: vm-neu-myproject-nonprod-01

# Auto-generated Terraform docs
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.57.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_windows_virtual_machine.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_subnet.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment type for the module. | `string` | `"nonprod"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of resources to create | `number` | `1` | no |
| <a name="input_location"></a> [location](#input\_location) | What location to use for the Azure Resources | `string` | `"norwayeast"` | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | What OS the Virtual Machine will be created with | `string` | `"linux"` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | What Storage Account type that should be backing the operating system disk | `string` | `"Standard_LRS"` | no |
| <a name="input_project"></a> [project](#input\_project) | The name of the project, or team or equivalent these resources should belong to | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The Public Key for authenticaton to a Linux machine | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to place resources in | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of subnet to create resources in | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username for the virtual Machine | `string` | `"adminuser"` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | The size of the Virtual Machine to create | `string` | `"Standard_B1s"` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of Virtual Network to create resources in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nic_ips"></a> [nic\_ips](#output\_nic\_ips) | IP addresses for the VMs |
| <a name="output_vm_ids"></a> [vm\_ids](#output\_vm\_ids) | Identifiers for the VMs |
<!-- END_TF_DOCS -->
