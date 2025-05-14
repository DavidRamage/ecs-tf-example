terraform {
  required_version = "1.8.0"
  required_providers {
    aws = {
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "dramage-terraform-statebucket"
    key    = "ecscluster"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}
