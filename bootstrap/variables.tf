#############################################################################
# Terraform variables                                                       #
#############################################################################
#############################################################################
# Google Cloud variables                                                    #
#############################################################################
variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP compute region ID"
}

variable "zone" {
  type        = string
  description = "GCP compute zone ID"
}

#############################################################################
# Services APIs                                                             #
#############################################################################
variable "enable_apis" {
  type        = bool
  description = "Flag to enable Google services APIs"
  default     = true
}

variable "activate_apis" {
  type        = list(string)
  description = "List of Google services APIs that will be activated"
  default     = []
}