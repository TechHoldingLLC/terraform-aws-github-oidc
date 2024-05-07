####################################
#  github_aws_open_id/provider.tf  #
####################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5"
    }
  }
}