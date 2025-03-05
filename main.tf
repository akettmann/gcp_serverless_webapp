terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
    random = {
      source  = "hashicorp/random"
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

locals {
  name = coalesce(var.deployment_name, random_string.name.result)
}

resource "google_cloud_run_v2_service" "app" {
  location = var.region
  name     = join("-", [local.name, "service"])


}
