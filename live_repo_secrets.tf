locals {
  environment = tomap({
    "state_bucket_name" : module.project.budget_name,
    "organization_id" : var.organization_id,
    "billing_account" : var.billing_account,
    "service_account_id" : module.project.service_account_id,
    "service_account_email" : module.project.service_account_email,
#    "project_id" : var.project_id,
    "environment_name" : var.name,
    "environment_group_name": var.group_name,
    "environment_folder_id" : google_folder.environment_folder.folder_id,
  })
}

resource "github_actions_secret" "environment" {
  repository      = github_repository.live_environment_group.name
  for_each        = local.environment
  secret_name     = each.key
  plaintext_value = each.value
}


