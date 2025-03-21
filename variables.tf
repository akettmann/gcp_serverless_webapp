variable "deployment_name" {
  type        = string
  default     = null
  description = "Unique, short identifying string used to identify components of this terraform, defaults to a randomly generates six (6) character string"
}
variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "Environment variables to present to the application"
}
variable "cpu" {
  type        = number
  default     = 500
  description = "CPU Per instance in kubernetes `m` units (one-thousandth CPU)"
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
  type        = string
  default     = "512M"
  description = "Memory Per instance, Kubernetes notation"
}
variable "image_name" {
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
  description = "container image the service should use"
}
variable "entrypoint" {
  type        = list(string)
  default     = null
  description = "Override the entrypoint of the Docker container"
}
variable "cmd" {
  type        = list(string)
  default     = null
  description = "Override the CMD of the Docker container"
}
variable "port_number" {
  type        = number
  default     = 80
  description = "What port the docker container is listening for http requests on"
}
variable "region" {
  type        = string
  default     = "us-central1"
  description = "Google Cloud region for the service to reside in"
}
variable "labels" {
  type        = map(string)
  default     = {}
  description = "labels to apply to all created infrastructure that supports it"
}
# Scaling
variable "concurrency" {
  type        = number
  default     = 1
  description = "Number of simultaneous requests a single container instance can run"
}
variable "min_instances" {
  type        = number
  default     = 0
  description = "Minimum number of instances to scale down to"
}
variable "max_instances" {
  type        = number
  default     = 100
  description = "Maximum number of containers to scale up to"
}
variable "publicly_visible" {
  type        = bool
  default     = true
  description = "Allow anyone to visit the service, if disabled, requires authorization headers. Ref: https://cloud.google.com/run/docs/authenticating/overview"
}
variable "deletion_protection" {
  type        = bool
  default     = true
  description = "Toggles Deletion protection for the google cloud run service."
}
