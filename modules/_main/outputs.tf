output "cloud_run_url" {
  description = "Public URL to service"
  value       = google_cloud_run_v2_service.app.uri
}
output "app_service_account" {
  description = "Service account the app user runs under, allows granting permissions once it is created."
  value       = google_service_account.app.account_id
}
output "max_requests_per_second" {
  description = "Max instances X Requests Per Instance = Max (Theoretical) requests per second handled"
  value       = var.max_instances * var.concurrency
}
