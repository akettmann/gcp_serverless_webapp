# Google Cloud Run Serverless Terraform Module
This is a terraform module to simply and quickly deploy a Docker container to Google Cloud Run (GCR). GCR is a serverless hosting service similar to Amazon Web Service (AWS) Elastic Container Service (ECS) with Fargate.





<!-- BEGIN_TF_DOCS -->
## Setup
To use this module you will need
* Terraform
* Some form of Google authorization
* A project already created
* Authorization for Cloud Run in the project
 ## Usage
The defaults will provision a publicly available simple webpage container (us-docker.pkg.dev/cloudrun/container/hello), and can be invoked as simple as replacing YOUR-PROJECT-NAME-HERE:
```hcl
module "main" {
source = "github.com/akettmann/gcp_serverless_webapp"
}
provider "google" {
  project = "YOUR-PROJECT-NAME-HERE"
}
output "url" {
  value = module.main.cloud_run_url
}
```
The main settings you are likely to want, with defaults:

```hcl
module "main" {
  source = "github.com/akettmann/gcp_serverless_webapp"
  # Environment variables to present to the application
  environment_variables = {}
  # CPU Per instance in kubernetes `m` units (one-thousandth CPU)
  cpu = 500
  # Memory Per instance, Kubernetes notation
  memory = "512M"
  # container image the service should use
  image_name = "us-docker.pkg.dev/cloudrun/container/hello"
  # Override the entrypoint of the Docker container
  entrypoint = null
  # Override the CMD of the Docker container
  cmd = null
  # What port the docker container is listening for http requests on
  port_number = 80
  # Google Cloud region for the service to reside in
  region = "us-central1"
  # Number of simultaneous requests a single container instance can run
  concurrency = 1
  # Toggles Deletion protection for the google cloud run service.
  deletion_protection = true
}
output "url" {
  value = module.main.cloud_run_url
}
```

Passing the output from the module at module_name.cloud_run_url outwards will give you the URL to access your service.
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_enable_apis"></a> [enable\_apis](#module\_enable\_apis) | ./modules/enable_apis | n/a |
| <a name="module_main"></a> [main](#module\_main) | ./modules/_main | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Unique, short identifying string used to identify components of this terraform, defaults to a randomly generates six (6) character string | `string` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables to present to the application | `map(string)` | `{}` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU Per instance in kubernetes `m` units (one-thousandth CPU) | `number` | `500` | no |
| <a name="input_startup_cpu_boost"></a> [startup\_cpu\_boost](#input\_startup\_cpu\_boost) | Enable/disable startup CPU boost for containers | `bool` | `false` | no |
| <a name="input_cpu_only_during_requests"></a> [cpu\_only\_during\_requests](#input\_cpu\_only\_during\_requests) | Determines whether CPU is only allocated during requests, True means between requests CPU will be heavily constrained | `bool` | `true` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory Per instance, Kubernetes notation | `string` | `"512M"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | container image the service should use | `string` | `"us-docker.pkg.dev/cloudrun/container/hello"` | no |
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | Override the entrypoint of the Docker container | `list(string)` | `null` | no |
| <a name="input_cmd"></a> [cmd](#input\_cmd) | Override the CMD of the Docker container | `list(string)` | `null` | no |
| <a name="input_port_number"></a> [port\_number](#input\_port\_number) | What port the docker container is listening for http requests on | `number` | `80` | no |
| <a name="input_region"></a> [region](#input\_region) | Google Cloud region for the service to reside in | `string` | `"us-central1"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | labels to apply to all created infrastructure that supports it | `map(string)` | `{}` | no |
| <a name="input_concurrency"></a> [concurrency](#input\_concurrency) | Number of simultaneous requests a single container instance can run | `number` | `1` | no |
| <a name="input_min_instances"></a> [min\_instances](#input\_min\_instances) | Minimum number of instances to scale down to | `number` | `0` | no |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | Maximum number of containers to scale up to | `number` | `100` | no |
| <a name="input_publicly_visible"></a> [publicly\_visible](#input\_publicly\_visible) | Allow anyone to visit the service, if disabled, requires authorization headers. Ref: https://cloud.google.com/run/docs/authenticating/overview | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Toggles Deletion protection for the google cloud run service. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_run_url"></a> [cloud\_run\_url](#output\_cloud\_run\_url) | Public URL to service |
| <a name="output_app_service_account"></a> [app\_service\_account](#output\_app\_service\_account) | Service account the app user runs under, allows granting permissions once it is created. |
| <a name="output_max_requests_per_second"></a> [max\_requests\_per\_second](#output\_max\_requests\_per\_second) | Max instances X Requests Per Instance = Max (Theoretical) requests per second handled |
<!-- END_TF_DOCS -->
