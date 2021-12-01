resource "random_string" "state_bucket_name_suffix" {
  length  = 5
  special = false
  lower   = true
  upper   = false
  number  = false
}

#locals {
#  environment_full_name = "${var.group_name}-${var.name}"
#}

resource "google_storage_bucket" "state" {
  name                        = "${var.name}-state-${random_string.state_bucket_name_suffix.result}"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = false
  project                     = var.group_project_id
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.state.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.environment_service_account.email}"
}
