resource "google_folder_iam_member" "admin_bindings" {
  member   = "serviceAccount:${google_service_account.environment_service_account.email}"
  folder   = google_folder.environment_folder.folder_id
  for_each = toset([
    "roles/billing.projectManager",
    #    "roles/billing.user",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/iam.securityAdmin", "roles/resourcemanager.folderAdmin", "roles/storage.admin"
  ])
  role     = each.value
}

resource "google_organization_iam_member" "billing_access" {
  member   = "serviceAccount:${google_service_account.environment_service_account.email}"
  org_id   = var.organization_id
  for_each = toset([
        "roles/billing.user",
#    "roles/billing.projectManager",
#        "roles/iam.securityReviewer",
#    "roles/resourcemanager.projectCreator",
#    "roles/resourcemanager.projectDeleter",
#    "roles/iam.securityAdmin", "roles/resourcemanager.folderAdmin", "roles/storage.admin"
  ])
  role     = each.value
}

#resource "google_folder_iam_member" "default_service_account_environment_group_folder" {
#  folder   = google_folder.environment_folder.folder_id
#  member   = "serviceAccount:${module.project.service_account_email}"
#  for_each = toset([
#    "roles/resourcemanager.folderAdmin", "roles/resourcemanager.organizationAdmin", "roles/owner",
#    "roles/resourcemanager.projectCreator", "roles/resourcemanager.projectIamAdmin", "roles/billing.projectManager",
#  ])
#  role     = each.value
#}