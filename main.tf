terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
resource "random_string" "name" {
  length  = 6
  lower   = true
  upper   = false
  numeric = true
  special = false
}
variable "name" {
  default = ""
}
locals {
  name = coalesce(var.name, random_string.name.result)
}
resource "google_service_account" "app" {
  account_id = join("-", [local.name, "app"])
}