variable "sql_server" {
  type = map(object({
    sql_svr_name                 = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)

  }))
}











