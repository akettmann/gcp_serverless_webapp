

# Pre-commit requirements
* Golang installed
* Terraform installed
*

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.13.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.app](https://registry.terraform.io/providers/hashicorp/google/6.13.0/docs/resources/cloud_run_service) | resource |
| [google_service_account.app](https://registry.terraform.io/providers/hashicorp/google/6.13.0/docs/resources/service_account) | resource |
| [random_string.name](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU Per instance, Kubernetes notation | `string` | `"500m"` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Unique, short identifying string used to identify components of this terraform, defaults to a randomly generates six (6) character string | `any` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables to present to the application | `map(string)` | `{}` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | container image the service should use | `string` | `"us-docker.pkg.dev/cloudrun/container/hello"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory Per instance, Kubernetes notation | `string` | `"512M"` | no |
| <a name="input_region"></a> [region](#input\_region) | Google Cloud region for the service to reside in | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_run_url"></a> [cloud\_run\_url](#output\_cloud\_run\_url) | n/a |
<!-- END_TF_DOCS -->
