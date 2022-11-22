#############################################################################
# Outputs                                                                   #
#############################################################################

output "core_vpc_network_self_link" {
  description = "VPC core network self link"
  value       = module.core_vpc.network_self_link
}

output "core_vpc_network_name" {
  description = "VPC core network name"
  value       = module.core_vpc.network_name
}

output "core_vpc_network_id" {
  description = "VPC core network ID"
  value       = module.core_vpc.network_id
}

output "core_vpc_subnets" {
  description = "VPC core subnets"
  value       = module.core_vpc.subnets
}

output "core_vpc_subnets_names" {
  description = "VPC core subnets names"
  value       = module.core_vpc.subnets_names
}

output "core_vpc_subnets_ips" {
  description = "VPC core subnets IPs and CIDR ranges"
  value       = module.core_vpc.subnets_ips
}

output "core_vpc_subnets_ids" {
  description = "VPC core subnets IDs"
  value       = module.core_vpc.subnets_ids
}

output "transit_vpc_network_self_link" {
  description = "VPC transit network self link"
  value       = module.transit_vpc.network_self_link
}

output "transit_vpc_network_name" {
  description = "VPC transit network name"
  value       = module.transit_vpc.network_name
}

output "transit_vpc_network_id" {
  description = "VPC transit network ID"
  value       = module.transit_vpc.network_id
}

output "transit_vpc_subnets" {
  description = "VPC transit subnets"
  value       = module.transit_vpc.subnets
}

output "transit_vpc_subnets_names" {
  description = "VPC transit subnets names"
  value       = module.transit_vpc.subnets_names
}

output "transit_vpc_subnets_ips" {
  description = "VPC transit subnets IPs and CIDR ranges"
  value       = module.transit_vpc.subnets_ips
}

output "transit_vpc_subnets_ids" {
  description = "VPC transit subnets IDs"
  value       = module.transit_vpc.subnets_ids
}