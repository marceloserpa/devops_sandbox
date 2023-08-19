resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket-name
  #acl = "public-read"
  ##policy = data.aws_iam_policy_document.website_policy.json
}

resource "aws_s3_bucket_website_configuration" "website_bucket_site_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_ownership_controls" "website_bucket_ocs" {
  depends_on = [aws_s3_bucket_public_access_block.website_bucket_ab]

  bucket = aws_s3_bucket.website_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "website_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.website_bucket_ocs]

  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "website_bucket_ab" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.allow_public_access_document.json
}

data "aws_iam_policy_document" "allow_public_access_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    effect = "Allow"

    resources = [
      aws_s3_bucket.website_bucket.arn,
      "${aws_s3_bucket.website_bucket.arn}/*",
    ]
  }
}
