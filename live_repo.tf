locals {
  live_repo_name = "live-${var.group_name}-${var.name}"
}
resource "github_repository" "live_environment" {
  name = local.live_repo_name
  visibility = "private"
  template {
    owner      = "bestowapp"
    repository = "template-live-environment"
  }
}