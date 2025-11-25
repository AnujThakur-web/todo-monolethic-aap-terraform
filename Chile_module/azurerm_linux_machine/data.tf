data "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault" "keyvault" {
#   for_each = var.vms
#   name                = each.value.keyvault_name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_key_vault_secret" "username" {
#   for_each = var.vms
#   name         = "adminuser"
#   key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
# }

# data "azurerm_key_vault_secret" "passwd" {
#   for_each = var.vms
#   name         = "password"
#   key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
# }


