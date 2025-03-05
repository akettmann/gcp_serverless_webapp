terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}
resource "google_cloud_run_service" "webapp" {
  location = ""
  name     = ""
}
