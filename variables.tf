## Common variables - These are vars that are likely common with other modules
variable "location" {
  default     = "norwayeast"
  description = "What location to use for the Azure Resources"
  type        = string
  validation {
    condition     = contains(["norwayeast", "westeurope"], var.location)
    error_message = "Environemtn must be in approved list"
  }
}

variable "project" {
  description = "The name of the project, or team or equivalent these resources should belong to"
  type        = string
  validation {
    condition     = length([var.project]) <= 12 # just a random number here - we could absolutely make this validation more robust
    error_message = "Max characters reached, project  name should be shorter"
  }
}

variable "instance_count" {
  default     = 1
  description = "The number of resources to create"
  type        = number
}

variable "environment" {
  default     = "nonprod"
  description = "The environment type for the module."
  type        = string
  validation {
    condition     = contains(["nonprod", "prod"], var.environment)
    error_message = "Environment must be in approved list"
  }
}

variable "resource_group_name" {
  description = "Name of the resource group to place resources in"
  type        = string
}

## Module specific vars

variable "operating_system" {
  description = "What OS the Virtual Machine will be created with"
  type        = string
  default     = "linux"
  validation {
    condition     = contains(["linux", "windows"], var.operating_system)
    error_message = "Must either be linux or windows"
  }
}

variable "virtual_machine_size" {
  description = "The size of the Virtual Machine to create"
  type        = string
  default     = "Standard_B1ls" # the cheapest
  validation {
    condition     = contains(["Standard_B1ls", "Standard_B1ms"], var.virtual_machine_size)
    error_message = "Size must be in approved list"
  }
}

variable "os_disk_storage_account_type" {
  default     = "Standard_LRS"
  description = "What Storage Account type that should be backing the operating system disk"
  validation {
    condition     = contains(["Standard_LRS", "Premium_ZRS"], var.os_disk_storage_account_type)
    error_message = "Storage account type should be in approved list"
  }
}


## Related to Auth

variable "username" {
  default     = "adminuser"
  description = "Username for the virtual Machine"
}

variable "public_key" {
  type        = string
  default     = null
  description = "The Public Key for authenticaton to a Linux machine"
}
