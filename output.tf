######################
#  github_aws_open_id/outputs.tf  #
######################

output "iam_role_arn" {
  value = aws_iam_role.github_oidc.arn
}
