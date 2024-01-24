#########################
#  github_aws_open_id/iam.tf  #
#########################

data "aws_iam_policy_document" "github_oidc_trust_policy" {
  statement {

    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]

    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    dynamic "condition" {
      for_each = try(var.env_repo_config, {})

      content {
        test     = "StringEquals"
        variable = "token.actions.githubusercontent.com:sub"

        values = flatten([
          for env, repos in var.env_repo_config : [for repo in toset(repos) : [
            "repo:${repo}:environment:${env}"
            ]
          ]
        ])
      }
    }

    dynamic "condition" {
      for_each = try(var.branch_repo_config, {})
      content {
        test     = "StringEquals"
        variable = "token.actions.githubusercontent.com:sub"

        values = flatten([
          for branch, repos in var.branch_repo_config : [for repo in toset(repos) : [
            "repo:${repo}:ref:refs/heads/${branch}",
            "repo:${repo}:pull_request"
            ]
          ]
        ])
      }
    }
  }
}

resource "aws_iam_role" "github_oidc" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust_policy.json

}

