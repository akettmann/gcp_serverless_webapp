terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
// terraform-docs-ignore
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

module "enable_apis" {
  source = "./modules/enable_apis"
}
module "main" {
  source = "./modules/_main"
  # There is a ~5 minute time after enabling Google APIs for it to take effect
  # Using depends on with a `sleep` provider to wait that time
  depends_on               = [module.enable_apis]
  deployment_name          = local.name
  environment_variables    = var.environment_variables
  cpu                      = var.cpu
  startup_cpu_boost        = var.startup_cpu_boost
  cpu_only_during_requests = var.cpu_only_during_requests
  memory                   = var.memory
  image_name               = var.image_name
  entrypoint               = var.entrypoint
  cmd                      = var.cmd
  port_number              = var.port_number
  region                   = var.region
  labels                   = var.labels
  concurrency              = var.concurrency
  min_instances            = var.min_instances
  max_instances            = var.max_instances
  publicly_visible         = var.publicly_visible
  deletion_protection      = var.deletion_protection
}
