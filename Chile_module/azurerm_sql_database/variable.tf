variable "sql_dbs" {
  type = map(object({
    sql_svr_name        = string
    sql_db_name         = string
    resource_group_name = string
    collation           = optional(string)
    license_type        = optional(string)
    max_size_gb         = optional(string)
    sku_name            = optional(string)
    enclave_type        = optional(string)
    tags                = optional(map(string))

  }))

}






