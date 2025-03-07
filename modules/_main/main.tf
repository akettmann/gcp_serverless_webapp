resource "google_cloud_run_v2_service" "app" {
  location            = var.region
  name                = join("-", [var.deployment_name, "service"])
  labels              = var.labels
  deletion_protection = var.deletion_protection
  template {
    containers {
      ports {
        container_port = var.port_number
        name           = "http1"
      }
      image = var.image_name
      resources {
        limits = {
          cpu    = "${var.cpu}m"
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
    scaling {
      max_instance_count = var.max_instances
      min_instance_count = var.min_instances
    }
    max_instance_request_concurrency = var.concurrency
  }
  lifecycle {
    precondition {
      condition     = !((var.concurrency > 1) && (var.cpu < 1000))
      error_message = "Invalid value specified for cpu. Total cpu < 1000m is not supported with concurrency > 1"
    }
  }
}
// terraform-docs-ignore
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  count    = var.publicly_visible ? 1 : 0
  member   = "allUsers"
  name     = google_cloud_run_v2_service.app.name
  role     = "roles/run.invoker"
  location = google_cloud_run_v2_service.app.location
}
