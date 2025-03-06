output "cloud_run_url" {
  value = google_cloud_run_v2_service.app.uri
}
output "app_service_account" {
  value = google_service_account.app.account_id
}
output "concurrency_limit" {
  value = <<EOT
With max instances ${var.max_instances} and requests per instance ${var.concurrency}, this service will at maximum handle ${var.max_instances * var.concurrency} requests at a time.
EOT
}
