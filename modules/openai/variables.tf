variable "name" {
  type        = string
  description = "Name of an application. It has to be unique."
}

variable "location" {
  type        = string
  description = "The geo-location where the resource lives."
}

variable "resource_group" {
  type        = string
  description = "To deploy to a resource group, use the ID of that resource group."
}

variable "tags" {
  type        = map(string)
  description = "Dictionary of tag names and values."
  default = {
    Terraform = "true"
  }
}

variable "identity_ids" {
  type        = list(string)
  description = "The list of user assigned identities associated with the resource."
  default     = []
}

variable "kind" {
  type        = string
  description = "The Kind of the resource."
}

variable "sku" {
  type        = string
  description = "The resource model definition representing SKU."
}

variable "custom_subdomain_name" {
  type        = string
  description = "Optional subdomain name used for token-based authentication."
  default     = ""
}

variable "network_acls_iprules" {
  type        = list(string)
  description = "List of Ips that are allowed to access resource."
  default     = []
}

variable "deployments" {
  type = list(object(
    {
      name = string
      model = object(
        {
          format  = string
          name    = string
          version = string
        }
      )
      scaleSettings = object(
        {
          scaleType = string
        }
      )
    }
  ))
  description = "List of models to deploy."
  default     = []
}