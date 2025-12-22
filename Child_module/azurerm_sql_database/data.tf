data "azurerm_mssql_server" "sqldbid" {
  for_each            = var.sql_dbs
  name                = each.value.sql_svr_name
  resource_group_name = each.value.resource_group_name
}

