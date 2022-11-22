#############################################################################
# VPN HA                                                                    #
#############################################################################
#############################################################################
# VPN core-to-transit                                                       #
#############################################################################

module "core_vpn_region_1" {
  source           = "terraform-google-modules/vpn/google//modules/vpn_ha"
  version          = "~> 2.3"
  project_id       = var.project_id
  region           = local.network_region_1
  network          = module.core_vpc.network_self_link
  name             = "core-to-transit-${local.network_region_1}"
  peer_gcp_gateway = module.transit_vpn_region_1.self_link
  router_asn       = local.core_vpn_router_asn
  # router_advertise_config = {
  #   mode   = "CUSTOM"
  #   groups = ["ALL_SUBNETS"]
  #   ip_ranges = {
  #     "${local.core_vpc_subnet_1_cidr}" = "core-subnet-1-${local.network_region_1}"
  #     "${local.core_vpc_subnet_2_cidr}" = "core-subnet-2-${local.network_region_2}"
  #   }
  # }
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.1"
        asn     = local.transit_vpn_router_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.1"
        asn     = local.transit_vpn_router_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
  }
}

#############################################################################
# VPN transit-to-core                                                       #
#############################################################################

module "transit_vpn_region_1" {
  source     = "terraform-google-modules/vpn/google//modules/vpn_ha"
  version    = "~> 2.3"
  project_id = var.project_id
  region     = local.network_region_1
  network    = module.transit_vpc.network_self_link
  name       = "transit-to-core-${local.network_region_1}"
  router_asn = local.transit_vpn_router_asn
  # router_advertise_config = {
  #   mode   = "CUSTOM"
  #   groups = ["ALL_SUBNETS"]
  #   ip_ranges = {
  #     "${local.transit_vpc_subnet_1_cidr}" = "transit-subnet-1-${local.network_region_1}"
  #     "${local.transit_vpc_subnet_2_cidr}" = "transit-subnet-2-${local.network_region_2}"
  #   }
  # }
  peer_gcp_gateway = module.core_vpn_region_1.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.2"
        asn     = local.core_vpn_router_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = module.core_vpn_region_1.random_secret
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.2"
        asn     = local.core_vpn_router_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = module.core_vpn_region_1.random_secret
    }
  }
}