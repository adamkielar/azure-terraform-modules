locals {
  ip_rules = [for ip in toset(var.network_acls_iprules) : {
    value : ip
    }
  ]
}