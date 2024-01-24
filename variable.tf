#########################
#  github_aws_open_id/variable.tf  #
#########################

variable "role_name" {
  type        = string
  description = "AWS IAM Role Name to setup OpenID Identity Provider"
}

variable "branch_repo_config" {
  description = "list of repo with specific branch"
  type        = any
  default     = null
}

variable "env_repo_config" {
  description = "list of repo with env"
  type        = any
  default     = null
}