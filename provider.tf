provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/TerraformDeployRole"
  }
}