output "vm_ids" {
  description = "Identifiers for the VMs"
  # Ugly stuff - but this ternary outputs the correct vm ids based on os and for all vms we choose to make
  value = var.operating_system == "linux" ? [for vm in azurerm_linux_virtual_machine.default : vm.id] : [for vm in azurerm_windows_virtual_machine.default : vm.id]
}

output "nic_ips" {
  description = "IP addresses for the VMs"
  value       = [for nic in azurerm_network_interface.default : nic.private_ip_address]
}
