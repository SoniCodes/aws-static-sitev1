# AWS Static Site (Manual + Terraform + CI/CD)

## Overview
This project demonstrates deploying a static website on AWS.  
I first created the deployment manually using the AWS Console (S3 + CloudFront), and then rebuilt the same project using Terraform for Infrastructure as Code (IaC).  

CI/CD is implemented with GitHub Actions: every push to `main` syncs files to the S3 bucket and invalidates CloudFront cache.

## Tech Stack
- **AWS S3** – static site bucket (private, CloudFront-only access)
- **AWS CloudFront** – CDN, HTTPS, caching
- **Terraform** – infrastructure as code (infra/ folder)
- **GitHub Actions** – CI/CD pipeline (`.github/workflows/deploy.yml`)
- **IAM** – least-privilege user for deploys

## Live Site
[CloudFront URL](https://[YOUR_CF_URL_HERE](https://d8js3zbzg9e1p.cloudfront.net/))

## IAM Policy (least privilege for CI/CD user)
```json
{
  "Version": "2012-10-17",
  "Statement": [
    { "Sid":"BucketMeta","Effect":"Allow","Action":["s3:ListBucket","s3:GetBucketLocation"],"Resource":"arn:aws:s3:::soni-static-site-tf" },
    { "Sid":"ObjectRW","Effect":"Allow","Action":["s3:GetObject","s3:PutObject","s3:DeleteObject"],"Resource":"arn:aws:s3:::soni-static-site-tf/*" },
    { "Sid":"CFInvalidate","Effect":"Allow","Action":["cloudfront:CreateInvalidation"],"Resource":"*" }
  ]
}
