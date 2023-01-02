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

variable "project_name" {
  description = "Project name"
  default     = ""
}

variable "repository_name" {
  description = "GitHub repository name"
}

variable "repository_owner" {
  description = "GitHub repository owner"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "s3_bucket_pipeline" {
  type        = string
  description = "s3_bucket_pipeline"
}
