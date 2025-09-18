# AWS Static Website — S3 + CloudFront + GitHub Actions CI/CD

A production-style static website hosted on **Amazon S3** (private bucket) and served globally through **Amazon CloudFront** with Origin Access Control (OAC). Deployment is fully automated using **GitHub Actions**.

---

## 🚀 Architecture
- **Amazon S3 (private bucket)** → stores static files (`index.html`).
- **Amazon CloudFront** → provides global CDN caching, HTTPS, and secure access to the S3 bucket via OAC.
- **GitHub Actions** → CI/CD pipeline that:
  1. Checks out repo
  2. Configures AWS credentials (via GitHub Secrets)
  3. Syncs files to S3
  4. Invalidates CloudFront cache to show changes immediately

**Live site:**  
👉 [https://d1euoscys9m5d1.cloudfront.net/](https://d1euoscys9m5d1.cloudfront.net/)

---

## 📂 Project Structure

aws-static-sitev1/
├─ src/                  # website source files
│  └─ index.html
├─ .github/workflows/    # GitHub Actions CI/CD pipeline
│  └─ deploy.yml
└─ README.md

