#############################################################################
# Google Cloud Build                                                        #
#############################################################################
#############################################################################
# VPC peering                                                               #
#############################################################################

resource "google_compute_global_address" "gcb_private_pool_addresses" {
  name          = "gcb-private-pool-addresses"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  address       = "192.168.1.0"
  prefix_length = 24
  description   = "IP address pool for GCP private pool in region ${local.network_region_1}"
  network       = module.core_vpc.network_self_link
}

resource "google_service_networking_connection" "gcb_private_pool_peering" {
  network                 = module.core_vpc.network_self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.gcb_private_pool_addresses.name]
}

resource "google_compute_network_peering_routes_config" "private_pool_peering_routes" {
  peering = google_service_networking_connection.gcb_private_pool_peering.peering
  network = module.core_vpc.network_name

  import_custom_routes = true
  export_custom_routes = true
}

#############################################################################
# GCP private pool                                                          #
#############################################################################

resource "google_cloudbuild_worker_pool" "gcb_private_pool" {
  name     = "private-pool-${local.network_region_1}"
  location = local.network_region_1
  worker_config {
    disk_size_gb   = 100
    machine_type   = "e2-medium"
    no_external_ip = true
  }
  network_config {
    peered_network = module.core_vpc.network_id
  }
  depends_on = [google_service_networking_connection.gcb_private_pool_peering]
}
