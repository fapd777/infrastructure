# S3 Static Site with CI/CD Pipeline

The purpose of this project is to build all the necessary components for a CI / CD pipeline that can deploy and update a static site hosted on S3 as well as distribute
that site to end users.

The infrastructure is codified in such a way that it can be redeployed to a different account with minor variable changes.

S3 is configured as a static site and used to host the content.

Amazon CloudFront is configured to distribute the content from the S3 static site.

Amazon CloudFront’s default behavior is configured to not cache.

Amazon CloudFront has SSL enabled using the Default CloudFront Certificate.

CodePipeline is configured in such a way to deploy / update the files for the site.

CodePipeline triggers off any commits or pull requests merged to a specific branch of the site’s source code git repository.

## Deployment

```bash
terraform init
```

```bash
terraform plan -var-file -var-file="in000x.tfvars"
```

```bash
terraform apply -var-file -var-file="in000x.tfvars"
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
