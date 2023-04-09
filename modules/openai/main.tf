resource "azapi_resource" "openai" {
  type                   = "Microsoft.CognitiveServices/accounts@2022-12-01"
  name                   = var.name
  location               = var.location
  parent_id              = var.resource_group
  tags                   = var.tags
  response_export_values = ["properties.endpoint"]

  identity {
    type         = "UserAssigned"
    identity_ids = var.identity_ids
  }

  body = jsonencode({
    properties = {
      customSubDomainName = var.custom_subdomain_name
      publicNetworkAccess = length(var.network_acls_iprules) == 0 ? "Enabled" : "Disabled"
      networkAcls = {
        defaultAction = "Deny"
        ipRules       = local.ip_rules
      }
    }

    sku = {
      name = var.sku
    }

    kind = var.kind
  })
}

resource "azapi_resource" "deployment" {
  for_each = { for item in var.deployments : item.name => item }

  type      = "Microsoft.CognitiveServices/accounts/deployments@2022-12-01"
  name      = each.value.name
  parent_id = azapi_resource.openai.id
  body = jsonencode({
    properties = {
      model         = each.value.model
      scaleSettings = each.value.scaleSettings
    }
  })
}