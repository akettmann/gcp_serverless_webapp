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
  labels = var.labels
  template {
    containers {
      image = var.image_name
      resources {
        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
        startup_cpu_boost = var.startup_cpu_boost
        cpu_idle          = var.cpu_only_during_requests
      }
      # Used the docker naming externally
      command = var.entrypoint
      args    = var.cmd
      dynamic "env" {
        for_each = var.environment_variables
        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }
}
