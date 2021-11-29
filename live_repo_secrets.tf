locals {
  environment = tomap({
    "billing_account" : var.billing_account,
    "domain_name" : var.domain_name,
    "environment_folder_id" : google_folder.environment_folder.folder_id,
    "environment_folder_name" : google_folder.environment_folder.name,
    "environment_group_name": var.group_name,
    "environment_name" : var.name,
    "organization_id" : var.organization_id,
    "service_account_email" : module.project.service_account_email,
    "service_account_id" : module.project.service_account_id,
    "state_bucket_name" : google_storage_bucket.state.name,
  })
}

resource "github_actions_secret" "environment" {
  repository      = github_repository.live_environment.name
  for_each        = local.environment
  secret_name     = each.key
  plaintext_value = each.value
  depends_on = [google_folder.environment_folder]
}


