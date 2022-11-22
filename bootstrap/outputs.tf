#############################################################################
# Output                                                                    #
#############################################################################

output "tf_state_bucket_name" {
  value       = google_storage_bucket.tf_state.name
  description = "Name of the bucket where Terraform state is stored."
}

output "tf_state_bucket_self_link" {
  value       = google_storage_bucket.tf_state.self_link
  description = "Self link of the bucket where Terraform state is stored."
}

output "tf_state_bucket_url" {
  value       = google_storage_bucket.tf_state.url
  description = "URL of the bucket where Terraform state is stored."
}

output "enabled_apis" {
  value       = module.project-services.enabled_apis
  description = "List of enabled Google service APIs in project."
}