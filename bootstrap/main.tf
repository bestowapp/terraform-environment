variable "billing_account" {}
variable "bucket_name" {}
variable "group_folder_id" {}
variable "group_name" {}
#variable "environment_display_name" {}
#variable "environment_name" {}
#variable "project_id" {}
variable "organization_id" {}
#variable "service_account_id" {}
variable "service_account_email" {}


output "billing_account" {
  value = var.billing_account
}

output "group_folder_id" {
  value = var.group_folder_id
}

#output "project_id" {
#  value = var.project_id
#}

output "group_name" {
  value = var.group_name
}

#output "environment_name" {
#  value = var.environment_name
#}

#output "environment_display_name" {
#  value = var.environment_display_name
#}
output "organization_id" {
  value = var.organization_id
}

#output "service_account_id" {
#  value = var.service_account_id
#}

output "service_account_email" {
  value = var.service_account_email
}

output "state_bucket_name" {
  value = var.bucket_name
}


#
#variable "billing_account" {}
#output "billing_account" {
#  value = var.billing_account
#}
#
#variable "state_bucket_name" {}
#output "state_bucket_name" {
#  value = var.state_bucket_name
#}
#
#variable "environment_group_name" {}
#output "environment_group_name" {
#  value = var.environment_group_name
#}
#
#variable "organization_id" {}
#output "organization_id" {
#  value = var.organization_id
#}
#
#
#variable "service_account_id" {}
#output "service_account_id" {
#  value = var.service_account_id
#}
#
#variable "service_account_email" {}
#
#output "service_account_email" {
#  value = var.service_account_email
#}
#
