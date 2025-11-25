resource "azurerm_mssql_database" "sqldbs_server" {
  for_each     = var.sql_dbs
  name         = each.value.sql_db_name
  server_id    = data.azurerm_mssql_server.sqldbid [each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags         = each.value.tags
}
