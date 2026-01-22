locals {
  base_name = format("%s-%s-%s", var.location, var.project, var.environment)
}

resource "azurerm_linux_virtual_machine" "default" {
  # Using a ternary to condionally create this Linux virtual machine - using the azure_virtual_machine resource is no longer recommended.
  count = var.operating_system == "linux" ? var.instance_count : 0

  # Implementation note here - i prefer interpolation as thats easier to read inline.
  # Format() may make sense too, but mostly when you need good control and will reuse a lot.
  # Here i chose to use format for local.base_name, but interpolation for adding  resource specific prefixes
  name                  = "vm-${local.base_name}-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.virtual_machine_size
  network_interface_ids = [azurerm_network_interface.default[count.index].id]
  admin_username        = var.username

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

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# we need a password - but dont want to store it anywhere
# In some cases we may want to output to a key vault, in other we may want to tell users to reset password to one they choose.
resource "random_password" "password" {
  count            = var.operating_system == "windows" ? var.instance_count : 0
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "azurerm_windows_virtual_machine" "default" {
  # Using a ternary to condionally create this windows virtual machine - using the azure_virtual_machine resource is no longer recommended.
  count = var.operating_system == "windows" ? var.instance_count : 0

  # Implementation note here - i prefer interpolation as thats easier to read inline.
  # Format() may make sense too, but mostly when you need good control and will reuse a lot.
  # Here i chose to use format for local.base_name, but interpolation for adding  resource specific prefixes
  name                  = "vm-${local.base_name}-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.virtual_machine_size
  network_interface_ids = [azurerm_network_interface.default[count.index].id]
  admin_username        = var.username
  admin_password        = random_password.password[count.index].result
  # Checkov flagged this. Extension operations are not good practice regardless
  allow_extension_operations = false
  os_disk {
    name                 = "osdisk-${local.base_name}-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  # like the linux vm above, this was also flagged by checkov
  encryption_at_host_enabled = true
}

resource "azurerm_network_interface" "default" {
  count               = var.instance_count
  name                = "nic-${local.base_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "ipconfig-${local.base_name}-${count.index}"
    public_ip_address_id          = azurerm_public_ip.default[count.index].id
    private_ip_address_allocation = "Dynamic"
    private_ip_address_version    = "IPv6"
  }
}

resource "azurerm_public_ip" "default" {
  count               = var.instance_count
  name                = "pip-${local.base_name}-${count.index}"
  location            = var.location
  allocation_method   = "Static"
  resource_group_name = var.resource_group_name
}
