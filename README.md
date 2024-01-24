## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.5 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.github_oidc_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.github](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_repo_config"></a> [branch\_repo\_config](#input\_branch\_repo\_config) | list of repo with specific branch | `any` | `null` | no |
| <a name="input_github_oidc_branch_repo_config"></a> [github\_oidc\_branch\_repo\_config](#input\_github\_oidc\_branch\_repo\_config) | list of repo with branch map | `any` | `null` | no |
| <a name="input_github_oidc_env_repo_config"></a> [github\_oidc\_env\_repo\_config](#input\_github\_oidc\_env\_repo\_config) | list of repo with env | `any` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | AWS IAM Role Name to setup OpenID Identity Provider | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | n/a |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-github-oidc/blob/main/LICENSE) for full details.
