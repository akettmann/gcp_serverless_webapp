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
