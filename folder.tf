resource "google_folder" "environment_folder" {
  display_name = var.display_name
  parent       = var.group_folder_name
}

