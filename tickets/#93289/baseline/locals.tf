#############################################################################
# Local variables                                                           #
#############################################################################

locals {
  network_region_1          = "europe-north1"
  network_region_2          = "europe-west1"
  core_vpn_router_asn       = 64513
  transit_vpn_router_asn    = 64514
  core_vpc_subnet_1_cidr    = "10.60.0.0/20"
  core_vpc_subnet_2_cidr    = "10.60.16.0/20"
  transit_vpc_subnet_1_cidr = "10.60.32.0/24"
  transit_vpc_subnet_2_cidr = "10.60.33.0/24"
  vpc_routing_mode          = "GLOBAL" # REGIONAL
}