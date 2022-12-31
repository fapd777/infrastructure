variable "s3_bucket_accountid" {
  description = "s3_bucket AWS account ID"
  type = string
}

variable "s3_bucket_bucket" {
  type        = string
  description = "s3_bucket Bucket Name"
}

variable "s3_bucket_region" {
  description = "s3_bucket AWS region"
  type = string
  default = "us-east-1"
}

variable "jira_tkt" {
  type        = string
  description = "Cloud Infra Jira Ticket"
}
variable "tags" {
  description = "Tag list to use for all resources"
  type    = map(string)
}
