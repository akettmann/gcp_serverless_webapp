terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "0.12.1"
    }
  }
}
# Enable the APIs we require in the project.
// terraform-docs-ignore
resource "google_project_service" "project" {
  for_each = toset(["iam", "run", "cloudresourcemanager"])
  service  = join(".", [each.value, "googleapis.com"])
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_on_destroy = false
}
resource "time_sleep" "wait_for_apis" {
  create_duration  = "5m"
  destroy_duration = "0s"
  depends_on       = [google_project_service.project]
}
