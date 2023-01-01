
//VERSIONING PROVIDERS
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
// UPLOADING TFSTATE IN S3
terraform {
  backend "s3" {
    bucket  = "381511845811-tfstate"
    key     = "s3-static-web/Terraform.tfstate"
    region  = "us-east-1"
    profile = "fernando"
  }
}
