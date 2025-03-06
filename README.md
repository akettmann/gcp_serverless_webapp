

# Pre-commit requirements
* Golang installed
* Terraform installed
*

<!-- BEGIN_TF_DOCS -->
# Purpose
This is a terraform module for deploying a container to Google Cloud Run

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |
| <a name="provider_google"></a> [google](#provider\_google) | 6.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_v2_service.app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service) | resource |
| [google_service_account.app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [random_string.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Unique, short identifying string used to identify components of this terraform, defaults to a randomly generates six (6) character string | `string` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables to present to the application | `map(string)` | `{}` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU Per instance, Kubernetes notation | `string` | `"500m"` | no |
| <a name="input_startup_cpu_boost"></a> [startup\_cpu\_boost](#input\_startup\_cpu\_boost) | Enable/disable startup CPU boost for containers | `bool` | `false` | no |
| <a name="input_cpu_only_during_requests"></a> [cpu\_only\_during\_requests](#input\_cpu\_only\_during\_requests) | Determines whether CPU is only allocated during requests, True means between requests CPU will be heavily constrained | `bool` | `true` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory Per instance, Kubernetes notation | `string` | `"512M"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | container image the service should use | `string` | `"us-docker.pkg.dev/cloudrun/container/hello"` | no |
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | Override the entrypoint of the Docker container | `list(string)` | `null` | no |
| <a name="input_cmd"></a> [cmd](#input\_cmd) | Override the CMD of the Docker container | `list(string)` | `null` | no |
| <a name="input_port_number"></a> [port\_number](#input\_port\_number) | What port the docker container is listening for http requests on | `number` | `80` | no |
| <a name="input_region"></a> [region](#input\_region) | Google Cloud region for the service to reside in | `string` | `"us-central1"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | labels to apply to all created infrastructure that supports it | `map(string)` | `{}` | no |
| <a name="input_concurrency"></a> [concurrency](#input\_concurrency) | Number of simultaneous requests a single container instance can run | `number` | `8` | no |
| <a name="input_min_instances"></a> [min\_instances](#input\_min\_instances) | Minimum number of instances to scale down to | `number` | `0` | no |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | Maximum number of containers to scale up to | `number` | `100` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_run_url"></a> [cloud\_run\_url](#output\_cloud\_run\_url) | Public URL to service |
| <a name="output_app_service_account"></a> [app\_service\_account](#output\_app\_service\_account) | Service account the app user runs under, allows granting permissions once it is created. |
| <a name="output_max_requests_per_second"></a> [max\_requests\_per\_second](#output\_max\_requests\_per\_second) | Max instances X Requests Per Instance = Max (Theoretical) requests per second handled |
<!-- END_TF_DOCS -->
