variable "CLIENT_CERTIFICATE" {}
variable "CLIENT_CERTIFICATE_PASSWORD" {}
variable "CLIENT_ID" {}
variable "TENANT_ID" {}

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.6.0"
    }
  }
}
provider "azuread" {
          client_id                   = var.CLIENT_ID
          client_certificate          = var.CLIENT_CERTIFICATE
          client_certificate_password = var.CLIENT_CERTIFICATE_PASSWORD
          tenant_id                   = var.TENANT_ID
}

