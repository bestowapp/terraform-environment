locals {
  live_repo_name = "live-${var.environment_group_name}-${var.name}"
}
resource "github_repository" "live_environment_group" {
  name = local.live_repo_name
  visibility = "private"
  template {
    owner      = "bestowapp"
    repository = "template-live-environment"
  }
}