output "cloud_run_url" {
  description = "Public URL to service"
  value       = module.main.cloud_run_url
}
output "app_service_account" {
  description = "Service account the app user runs under, allows granting permissions once it is created."
  value       = module.main.app_service_account
}
output "max_requests_per_second" {
  description = "Max instances X Requests Per Instance = Max (Theoretical) requests per second handled"
  value       = module.main.max_requests_per_second
}
