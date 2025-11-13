resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.ip_config_name
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id     
      private_ip_address_allocation = ip_configuration.value.pip_alloc
      # Attach a public IP if a matching entry is provided via var.public_ips
      public_ip_address_id = try(var.public_ips[var.nic[each.key].pip_name].id, null)
    }
  }
}




 
