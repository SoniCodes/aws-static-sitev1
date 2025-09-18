# AWS Static Website — S3 + CloudFront + GitHub Actions CI/CD

A production-style static website hosted on **Amazon S3** (private bucket) and served globally through **Amazon CloudFront** with Origin Access Control (OAC). Deployment is fully automated using **GitHub Actions**.

---

## Architecture
- **Amazon S3 (private bucket)** → stores static files (`index.html`).
- **Amazon CloudFront** → provides global CDN caching, HTTPS, and secure access to the S3 bucket via OAC.
- **GitHub Actions** → CI/CD pipeline that:
  1. Checks out repo
  2. Configures AWS credentials (via GitHub Secrets)
  3. Syncs files to S3
  4. Invalidates CloudFront cache to show changes immediately

**Live site:**  
 [https://d1euoscys9m5d1.cloudfront.net/](https://d1euoscys9m5d1.cloudfront.net/)

---

## CI/CD Workflow
Located in `.github/workflows/deploy.yml`.

Triggered on **push to `main`**, the workflow:

- Checkout code
- Configure AWS credentials
- Sync `src/` to S3 bucket
- Invalidate CloudFront distribution

--- 

## Minimal IAM policy

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "BucketMeta",
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:GetBucketLocation"],
      "Resource": "arn:aws:s3:::soni-static-websitev1-202509"
    },
    {
      "Sid": "ObjectRW",
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::soni-static-websitev1-202509/*"
    },
    {
      "Sid": "CFInvalidate",
      "Effect": "Allow",
      "Action": ["cloudfront:CreateInvalidation"],
      "Resource": "*"
    }
  ]
}



