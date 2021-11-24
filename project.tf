locals {
  project_name = "${var.environment_group_name}-${var.name}"
}

module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2"

  name              = local.project_name
  org_id            = var.organization_id
  billing_account   = var.billing_account
  folder_id         = var.group_folder_id
  random_project_id = true
  activate_apis     = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "firebase.googleapis.com"
  ]
}