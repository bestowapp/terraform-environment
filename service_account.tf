resource "google_service_account" "environment_service_account" {
  account_id = "${var.name}-environment-sa"
  project = var.group_project_id
}
