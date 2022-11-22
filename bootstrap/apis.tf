#############################################################################
# Google Cloud services APIs                                                #
#############################################################################

module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.0"

  project_id = var.project_id

  disable_services_on_destroy = false
  enable_apis                 = var.enable_apis
  activate_apis               = var.activate_apis
}