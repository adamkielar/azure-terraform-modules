resource "azurerm_resource_group" "this" {
  name     = "tf-openai-rg"
  location = "East US"
}

resource "azurerm_user_assigned_identity" "this" {
  location            = "East US"
  name                = "openai-id"
  resource_group_name = azurerm_resource_group.this.name
}

module "openai" {
  source = "../../modules/openai"

  name                 = var.name
  location             = var.location
  resource_group       = azurerm_resource_group.this.id
  identity_ids         = [azurerm_user_assigned_identity.this.id]
  sku                  = var.sku
  kind                 = var.kind
  network_acls_iprules = var.network_acls_iprules

  deployments = var.deployments
}


output "id" {
  description = "An ID of a resource."
  value       = module.openai.id
}

output "endpoint" {
  description = "Fqdn of a cognitive service endpoint"
  value       = module.openai.endpoint
}

provider "azurerm" {
  features {}
}