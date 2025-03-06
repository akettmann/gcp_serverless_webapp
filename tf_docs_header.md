## Setup
To use this module you will need
* Terraform
* Some form of Google authorization
* A project already created
* Authorization for Cloud Run in the project

## Usage
The defaults will provision a publicly available simple webpage container (`us-docker.pkg.dev/cloudrun/container/hello`), and can be invoked as simple as replacing `YOUR-PROJECT-NAME-HERE`:
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

The main settings you are likely to need, with defaults:

```hcl
module "main" {
  source = "github.com/akettmann/gcp_serverless_webapp"
  image_name = "us-docker.pkg.dev/cloudrun/container/hello"
  entrypoint = null
  cmd = null
  port_number = 80
  memory = "512M"
  cpu = 500
}
provider "google" {
  project = "YOUR-PROJECT-NAME-HERE"
}
```
