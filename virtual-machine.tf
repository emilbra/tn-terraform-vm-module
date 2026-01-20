locals {
  base_name = format("%s-%s-%s", var.location, var.project, var.environment)
}

resource "azurerm_linux_virtual_machine" "default" {
  # Using a ternary to condionally create this Linux virtual machine - using the azure_virtual_machine resource is no longer recommended.
  count = var.operating_system == "linux" ? var.count : null

  # Implementation note here - i prefer interpolation as thats easier to read inline.
  # Format() may make sense too, but mostly when you need good control and will reuse a lot.
  # Here i chose to use format for local.base_name, but interpolation for adding  resource specific prefixes
  name                = "vm-${local.base_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  size                  = var.virtual_machine_size
  network_interface_ids = azurerm_network_interface.default[count.index].id

  admin_ssh_key {
    username = var.username
    # I've seen implementations were we just let this be handled by env vars.
    # I currently prefer this approach as this lets such matters be up to the caller
    public_key = var.public_key
  }

  # Checkov flagged this. Extension operations are not good practice regardless
  allow_extension_operations = false
  os_disk {
    name                 = "osdisk-${local.base_name}-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }
}

resource "azurerm_network_interface" "default" {
  count               = var.count
  name                = "nic-${local.base_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name = "ipconfig-${local.base_name}-${count.index}"
    # Opionated choice altough i highly doubt youd ever want dynamic
    private_ip_address_allocation = "Static"
  }
}
