output "secret_value" {
  value     = azurerm_key_vault_secret.kv_secret
  sensitive = false
}