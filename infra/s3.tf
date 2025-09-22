resource "aws_s3_bucket" "static_site" {
  bucket = "soni-static-site-tf"
  tags   = { project = "phase1-tf" }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.static_site.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.static_site.id

  rule { object_ownership = "BucketOwnerEnforced" }
}
