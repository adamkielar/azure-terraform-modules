output "id" {
  description = "An ID of a resource."
  value       = azapi_resource.openai.id
}

output "endpoint" {
  description = "Fqdn of a cognitive service endpoint"
  value       = jsondecode(azapi_resource.openai.output).properties.endpoint
}