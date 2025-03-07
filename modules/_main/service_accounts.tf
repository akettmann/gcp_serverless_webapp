resource "google_service_account" "app" {
  account_id = join("-", [var.deployment_name, "app"])
}
