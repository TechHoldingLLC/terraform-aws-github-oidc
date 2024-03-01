# OIDC Service
Below is an examples of calling this module.

# GitHub AWS OpenID connect using Identity Provider

# Branch and Pull Request Base Configuration
```
module "github_aws_open_id" {
  source             = "./github_aws_open_id"
  role_name          = "my-github-actions"
  branch_repo_config = lookup(local.github_oidc_branch_repo_config, var.env)

  providers = {
    aws = aws
  }
}

locals {
  github_repos = [
    "org_name/repo_name_1",
    "org_name/repo_name_2",
    "org_name/repo_name_3",
    "org_name/repo_name_4"
  ]
  github_oidc_branch_repo_config = {
    dev = {
      dev_branch_name = local.github_repos
    },
    prod = {
      prod_branch_name = local.github_repos
    }
  }
}

resource "aws_iam_role_policy_attachment" "github_aws_oidc" {
  role       = module.github_aws_open_id.iam_role_name
  policy_arn = "policy_arn"
}

```
# Environment Base Configuration
```
module "github_aws_open_id" {
  source             = "./github_aws_open_id"
  role_name          = "my-github-actions"
  env_repo_config = {
    "${var.env}" = local.repo_list
  }

  providers = {
    aws = aws
  }
}

locals {
  repo_list = [
    "org_name/repo_name_1",
    "org_name/repo_name_2",
    "org_name/repo_name_3",
    "org_name/repo_name_4"
  ]
}

resource "aws_iam_role_policy_attachment" "github_aws_oidc" {
  role       = module.github_aws_open_id.iam_role_name
  policy_arn = "policy_arn"
}

```

# Environment and Branch Base Both Configuration
```
module "github_aws_open_id" {
  source             = "./github_aws_open_id"
  role_name          = "my-github-actions"
  branch_repo_config = lookup(local.github_oidc_branch_repo_config, var.env)
  env_repo_config = {
    "${var.env}" = local.repo_list
  }

  providers = {
    aws = aws
  }
}

locals {
  repo_list = [
    "org_name/repo_name_1",
    "org_name/repo_name_2",
    "org_name/repo_name_3",
    "org_name/repo_name_4"
  ]
  github_oidc_branch_repo_config = {
    dev = {
      dev_branch_name = local.github_repos
    },
    prod = {
      prod_branch_name = local.github_repos
    }
  }
}

resource "aws_iam_role_policy_attachment" "github_aws_oidc" {
  role       = module.github_aws_open_id.iam_role_name
  policy_arn = "policy_arn"
}
```

