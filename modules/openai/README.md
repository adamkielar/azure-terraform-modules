<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | 1.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.deployment](https://registry.terraform.io/providers/Azure/azapi/1.5.0/docs/resources/resource) | resource |
| [azapi_resource.openai](https://registry.terraform.io/providers/Azure/azapi/1.5.0/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | Optional subdomain name used for token-based authentication. | `string` | `""` | no |
| <a name="input_deployments"></a> [deployments](#input\_deployments) | List of models to deploy. | <pre>list(object(<br>    {<br>      name = string<br>      model = object(<br>        {<br>          format  = string<br>          name    = string<br>          version = string<br>        }<br>      )<br>      scaleSettings = object(<br>        {<br>          scaleType = string<br>        }<br>      )<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | The list of user assigned identities associated with the resource. | `list(string)` | `[]` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | The Kind of the resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The geo-location where the resource lives. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of an application. It has to be unique. | `string` | n/a | yes |
| <a name="input_network_acls_iprules"></a> [network\_acls\_iprules](#input\_network\_acls\_iprules) | List of Ips that are allowed to access resource. | `list(string)` | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | To deploy to a resource group, use the ID of that resource group. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The resource model definition representing SKU. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Dictionary of tag names and values. | `map(string)` | <pre>{<br>  "Terraform": "true"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Fqdn of a cognitive service endpoint |
| <a name="output_id"></a> [id](#output\_id) | An ID of a resource. |
<!-- END_TF_DOCS -->