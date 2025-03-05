resource "google_service_account" "app" {
  account_id = join("-", [local.name, "app"])
}
