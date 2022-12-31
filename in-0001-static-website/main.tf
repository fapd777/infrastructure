
//VERSIONING PROVIDERS
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
// UPLOADING TFSTATE IN S3
terraform {
  backend "s3" {
    bucket  = "381511845811-tfstate"
    key     = "in-0001-static-web/Terraform.tfstate"
    region  = "us-east-1"
    profile = "fernando"
  }
}
