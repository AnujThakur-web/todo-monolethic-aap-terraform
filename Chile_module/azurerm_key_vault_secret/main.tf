resource "azurerm_key_vault_secret" "kv_secret" {
   for_each     = var.kvs
  name         = each.value.kvs-name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kvdata[each.key].id

  
}


