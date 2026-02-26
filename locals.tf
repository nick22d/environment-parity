locals {
  account_ids = {
    dev     = "111111111111"
    staging = "222222222222"
    prod    = "333333333333"
  }

  account_id = local.account_ids[terraform.workspace]
  
  config = {
    dev = {
      instance_type  = "t3.micro"
      min_capacity   = 1
      multi_az       = false
    }
    prod = {
      instance_type  = "m5.xlarge"
      min_capacity   = 3
      multi_az       = true
    }
  }

  cfg = local.config[terraform.workspace]
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/TerraformDeployRole"
  }
}