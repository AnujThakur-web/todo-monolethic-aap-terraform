output "kv_id" {
#   value = azurerm_key_vault.keyvault

  value = {
    for a, v in azurerm_key_vault.kv : a => v.id

  }

}

# output "keyvaultid2" {
#   # value = azurerm_key_vault.keyvault

#   value = {
#     for b, c in azurerm_key_vault.keyvault : b => c.name

#   }

# }
