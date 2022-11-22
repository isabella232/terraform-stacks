# Terraform stack for ZenDesk ticket 93289
[GCB private pools - accessing private resources](https://doitintl.zendesk.com/agent/tickets/93289)
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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_core_vpc"></a> [core\_vpc](#module\_core\_vpc) | terraform-google-modules/network/google | ~> 5.2 |
| <a name="module_core_vpn_region_1"></a> [core\_vpn\_region\_1](#module\_core\_vpn\_region\_1) | terraform-google-modules/vpn/google//modules/vpn_ha | ~> 2.3 |
| <a name="module_transit_vpc"></a> [transit\_vpc](#module\_transit\_vpc) | terraform-google-modules/network/google | ~> 5.2 |
| <a name="module_transit_vpn_region_1"></a> [transit\_vpn\_region\_1](#module\_transit\_vpn\_region\_1) | terraform-google-modules/vpn/google//modules/vpn_ha | ~> 2.3 |

## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_worker_pool.gcb_private_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_worker_pool) | resource |
| [google_compute_global_address.gcb_private_pool_addresses](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network_peering_routes_config.private_pool_peering_routes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config) | resource |
| [google_service_networking_connection.gcb_private_pool_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP compute region ID | `string` | n/a | yes |
| <a name="input_ticket_number"></a> [ticket\_number](#input\_ticket\_number) | Zendesk ticket number | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP compute zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_core_vpc_network_id"></a> [core\_vpc\_network\_id](#output\_core\_vpc\_network\_id) | VPC core network ID |
| <a name="output_core_vpc_network_name"></a> [core\_vpc\_network\_name](#output\_core\_vpc\_network\_name) | VPC core network name |
| <a name="output_core_vpc_network_self_link"></a> [core\_vpc\_network\_self\_link](#output\_core\_vpc\_network\_self\_link) | VPC core network self link |
| <a name="output_core_vpc_subnets"></a> [core\_vpc\_subnets](#output\_core\_vpc\_subnets) | VPC core subnets |
| <a name="output_core_vpc_subnets_ids"></a> [core\_vpc\_subnets\_ids](#output\_core\_vpc\_subnets\_ids) | VPC core subnets IDs |
| <a name="output_core_vpc_subnets_ips"></a> [core\_vpc\_subnets\_ips](#output\_core\_vpc\_subnets\_ips) | VPC core subnets IPs and CIDR ranges |
| <a name="output_core_vpc_subnets_names"></a> [core\_vpc\_subnets\_names](#output\_core\_vpc\_subnets\_names) | VPC core subnets names |
| <a name="output_transit_vpc_network_id"></a> [transit\_vpc\_network\_id](#output\_transit\_vpc\_network\_id) | VPC transit network ID |
| <a name="output_transit_vpc_network_name"></a> [transit\_vpc\_network\_name](#output\_transit\_vpc\_network\_name) | VPC transit network name |
| <a name="output_transit_vpc_network_self_link"></a> [transit\_vpc\_network\_self\_link](#output\_transit\_vpc\_network\_self\_link) | VPC transit network self link |
| <a name="output_transit_vpc_subnets"></a> [transit\_vpc\_subnets](#output\_transit\_vpc\_subnets) | VPC transit subnets |
| <a name="output_transit_vpc_subnets_ids"></a> [transit\_vpc\_subnets\_ids](#output\_transit\_vpc\_subnets\_ids) | VPC transit subnets IDs |
| <a name="output_transit_vpc_subnets_ips"></a> [transit\_vpc\_subnets\_ips](#output\_transit\_vpc\_subnets\_ips) | VPC transit subnets IPs and CIDR ranges |
| <a name="output_transit_vpc_subnets_names"></a> [transit\_vpc\_subnets\_names](#output\_transit\_vpc\_subnets\_names) | VPC transit subnets names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->