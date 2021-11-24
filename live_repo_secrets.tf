locals {
  environment = tomap({
    "bucket_name" : var.bucket_name,
    "organization_id" : var.organization_id,
    "billing_account" : var.billing_account,
    "service_account_id" : var.service_account_id,
    "service_account_email" : var.service_account_email,
#    "project_id" : var.project_id,
    "environment_name" : var.name,
    "environment_group_name": var.environment_group_name,
    "environment_folder_id" : google_folder.environment_folder.folder_id,
  })
}

resource "github_actions_secret" "environment" {
  repository      = github_repository.live_environment_group.name
  for_each        = local.environment
  secret_name     = each.key
  plaintext_value = each.value
}


