data "azurerm_key_vault" "kvdata" {
  for_each = var.kvs
  name                = each.value.kvd_name
  resource_group_name = each.value.resource_group_name
}

