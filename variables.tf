variable "deployment_name" {
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
variable "region" {
  type = string
  default = "us-central1"
  description = "Google Cloud region for the service to reside in"
}
