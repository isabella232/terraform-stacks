# Terraform stack PoC GKE Gateway

https://cloud.google.com/kubernetes-engine/docs/how-to/deploying-gateways#internal-gateway

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
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster | ~> 23.3 |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | terraform-google-modules/network/google//modules/subnets-beta | ~> 5.2 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google//modules/vpc | ~> 5.2 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.iap_tcp_forwarding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.lb_health_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.iap_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_router.vpc_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.vpc_router_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnet_iap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gke_cluster_enable_intranode_visibility"></a> [gke\_cluster\_enable\_intranode\_visibility](#input\_gke\_cluster\_enable\_intranode\_visibility) | Whether Intra-node visibility is enabled for this cluster. This makes same node pod to pod traffic visible for VPC network. | `bool` | `false` | no |
| <a name="input_gke_cluster_enable_private_endpoint"></a> [gke\_cluster\_enable\_private\_endpoint](#input\_gke\_cluster\_enable\_private\_endpoint) | Whether the master's internal IP address is used as the cluster endpoint. | `bool` | `false` | no |
| <a name="input_gke_cluster_enable_private_nodes"></a> [gke\_cluster\_enable\_private\_nodes](#input\_gke\_cluster\_enable\_private\_nodes) | Whether nodes have internal IP addresses only. | `bool` | `false` | no |
| <a name="input_gke_cluster_master_authorized_networks"></a> [gke\_cluster\_master\_authorized\_networks](#input\_gke\_cluster\_master\_authorized\_networks) | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists). | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| <a name="input_gke_cluster_master_ipv4_cidr_block"></a> [gke\_cluster\_master\_ipv4\_cidr\_block](#input\_gke\_cluster\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network. | `string` | n/a | yes |
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | GKE cluster name. | `string` | `"test-cluster"` | no |
| <a name="input_gke_cluster_node_pools"></a> [gke\_cluster\_node\_pools](#input\_gke\_cluster\_node\_pools) | List of maps containing node pools. | `list(map(any))` | n/a | yes |
| <a name="input_gke_cluster_regional"></a> [gke\_cluster\_regional](#input\_gke\_cluster\_regional) | Flag to enable a GKE regional cluster. | `bool` | `false` | no |
| <a name="input_gke_cluster_remove_default_node_pool"></a> [gke\_cluster\_remove\_default\_node\_pool](#input\_gke\_cluster\_remove\_default\_node\_pool) | Remove default node pool while setting up the cluster. | `bool` | `false` | no |
| <a name="input_gke_cluster_version"></a> [gke\_cluster\_version](#input\_gke\_cluster\_version) | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region. | `string` | `"latest"` | no |
| <a name="input_iap_proxy_subnet_cidr_range"></a> [iap\_proxy\_subnet\_cidr\_range](#input\_iap\_proxy\_subnet\_cidr\_range) | The range of internal addresses that are owned by IAP proxysubnetwork. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP compute region ID | `string` | n/a | yes |
| <a name="input_vpc_auto_create_subnetworks"></a> [vpc\_auto\_create\_subnetworks](#input\_vpc\_auto\_create\_subnetworks) | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. <br>When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| <a name="input_vpc_delete_default_igw_routes"></a> [vpc\_delete\_default\_igw\_routes](#input\_vpc\_delete\_default\_igw\_routes) | If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted. | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | `"test-vpc"` | no |
| <a name="input_vpc_routing_mode"></a> [vpc\_routing\_mode](#input\_vpc\_routing\_mode) | VPC routing mode | `string` | `"GLOBAL"` | no |
| <a name="input_vpc_subnets"></a> [vpc\_subnets](#input\_vpc\_subnets) | The list of subnets being created. | `list(map(string))` | n/a | yes |
| <a name="input_vpc_subnets_secondary_ranges"></a> [vpc\_subnets\_secondary\_ranges](#input\_vpc\_subnets\_secondary\_ranges) | Secondary ranges that will be used in some of the subnets. | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP compute zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_network_id"></a> [vpc\_network\_id](#output\_vpc\_network\_id) | VPC network ID |
| <a name="output_vpc_network_name"></a> [vpc\_network\_name](#output\_vpc\_network\_name) | VPC network name |
| <a name="output_vpc_network_self_link"></a> [vpc\_network\_self\_link](#output\_vpc\_network\_self\_link) | VPC network self link |
| <a name="output_vpc_subnets"></a> [vpc\_subnets](#output\_vpc\_subnets) | VPC subnets |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->