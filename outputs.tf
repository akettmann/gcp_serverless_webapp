output "cloud_run_url" {
  value = google_cloud_run_v2_service.app.uri
}
output "app_service_account" {
  value = google_service_account.app.account_id
}
