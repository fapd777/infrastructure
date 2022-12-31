provider "aws" {
  region = var.s3_bucket_region
}

provider "aws" {
  alias   = "s3_bucket"
  version = "~> 3.0"
  region  = var.s3_bucket_region
  profile = "fernando"
}