resource "google_folder" "environment_folder" {
  display_name = var.display_name
  parent       = var.group_folder_name
}

resource "google_folder_iam_member" "default_service_account_environment_group_folder" {
  folder   = google_folder.environment_folder.folder_id
  member   = "serviceAccount:${var.service_account_email}"
  for_each = toset([
    "roles/resourcemanager.folderAdmin", "roles/resourcemanager.organizationAdmin", "roles/owner",
    "roles/resourcemanager.projectCreator", "roles/resourcemanager.projectIamAdmin", "roles/billing.projectManager",
  ])
  role     = each.value
}