#############################################################################
# VPC and subnets                                                           #
#############################################################################
#############################################################################
# VPC core                                                                  #
#############################################################################

module "core_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.2"
  project_id = var.project_id

  network_name            = "core-vpc"
  description             = "VPC core to test ticket ${var.ticket_number}"
  auto_create_subnetworks = false
  routing_mode            = local.vpc_routing_mode
  shared_vpc_host         = false

  subnets = [
    {
      subnet_name   = "core-subnet-1-${local.network_region_1}"
      subnet_ip     = local.core_vpc_subnet_1_cidr
      subnet_region = local.network_region_1
    },
    {
      subnet_name   = "core-subnet-2-${local.network_region_2}"
      subnet_ip     = local.core_vpc_subnet_2_cidr
      subnet_region = local.network_region_2
    },
  ]

  delete_default_internet_gateway_routes = false
}

#############################################################################
# VPC transit                                                               #
#############################################################################

module "transit_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.2"
  project_id = var.project_id

  network_name            = "transit-vpc"
  description             = "VPC transit to test ticket ${var.ticket_number}"
  auto_create_subnetworks = false
  routing_mode            = local.vpc_routing_mode
  shared_vpc_host         = false

  subnets = [
    {
      subnet_name   = "transit-subnet-1-${local.network_region_1}"
      subnet_ip     = local.transit_vpc_subnet_1_cidr
      subnet_region = local.network_region_1
    },
    {
      subnet_name   = "transit-subnet-2-${local.network_region_2}"
      subnet_ip     = local.transit_vpc_subnet_2_cidr
      subnet_region = local.network_region_2
    },
  ]

  delete_default_internet_gateway_routes = false
}

#############################################################################
# VPC peering                                                               #
#############################################################################

# module "peering_core_transit" {
#   source        = "terraform-google-modules/network/google//modules/network-peering"
#   version       = "~> 5.2"
#   local_network = module.core_vpc.network_self_link
#   peer_network  = module.transit_vpc.network_self_link
# }