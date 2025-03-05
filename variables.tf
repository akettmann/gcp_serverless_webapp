variable "deployment_name" {
  type = string
  default = null
  description = "Unique, short identifying string used to identify components of this terraform, defaults to a randomly generates six (6) character string"
}
variable "environment_variables" {
  type = map(string)
  default = {}
  description = "Environment variables to present to the application"
}
variable "cpu" {
  type = string
  default = "500m"
  description = "CPU Per instance, Kubernetes notation"
}
variable "startup_cpu_boost" {
  type        = bool
  default     = false
  description = "Enable/disable startup CPU boost for containers"
}
variable "cpu_only_during_requests" {
  type        = bool
  default     = true
  description = "Determines whether CPU is only allocated during requests, True means between requests CPU will be heavily constrained"
}
variable "memory" {
  type = string
  default = "512M"
  description = "Memory Per instance, Kubernetes notation"
}
variable "image_name" {
  type = string
  default = "us-docker.pkg.dev/cloudrun/container/hello"
  description = "container image the service should use"
}
variable "entrypoint" {
  type = list(string)
  default = null
  description = "Override the entrypoint of the Docker container"
}
variable "cmd" {
  type = list(string)
  default = null
  description = "Override the CMD of the Docker container"
}
variable "region" {
  type = string
  default = "us-central1"
  description = "Google Cloud region for the service to reside in"
}
variable labels {
  type = map(string)
  default = {}
  description = "labels to apply to all created infrastructure that supports it"
}
