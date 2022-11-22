# Terraform bootstrap stack
This stack creates all needed infrastructure to deploy other Terraform stacks in a given sandbox GCP project.
It is intended to de deployed manually.

# Prerequisites
* [Terraform 0.13+](https://developer.hashicorp.com/terraform/downloads)
* [terraform-docs](https://github.com/terraform-docs/terraform-docs/releases/)
* [tflint](https://github.com/terraform-linters/tflint)
* [pre-commit](https://pre-commit.com/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project-services"></a> [project-services](#module\_project-services) | terraform-google-modules/project-factory/google//modules/project_services | ~> 14.0 |

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.tf_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_id.bucket_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of Google services APIs that will be activated | `list(string)` | `[]` | no |
| <a name="input_enable_apis"></a> [enable\_apis](#input\_enable\_apis) | Flag to enable Google services APIs | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP compute region ID | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP compute zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | List of enabled Google service APIs in project. |
| <a name="output_tf_state_bucket_name"></a> [tf\_state\_bucket\_name](#output\_tf\_state\_bucket\_name) | Name of the bucket where Terraform state is stored. |
| <a name="output_tf_state_bucket_self_link"></a> [tf\_state\_bucket\_self\_link](#output\_tf\_state\_bucket\_self\_link) | Self link of the bucket where Terraform state is stored. |
| <a name="output_tf_state_bucket_url"></a> [tf\_state\_bucket\_url](#output\_tf\_state\_bucket\_url) | URL of the bucket where Terraform state is stored. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
