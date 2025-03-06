output "cloud_run_url" {
  value = google_cloud_run_v2_service.app.uri
}
output "app_service_account" {
  value = google_service_account.app.account_id
}
output "max_requests_per_second" {
  description = "Max instances X Requests Per Instance = Max (Theoretical) requests per second handled"
  value       = var.max_instances * var.concurrency
}
