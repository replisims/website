#####  Plugins and versions

terraform {
  required_version = "~> 0.12.16"

  required_providers {
    aws      = "~> 2.55"
  }
}

provider "aws" {
  region = "eu-west-1"
}


#####  Global locals

locals {
  project = "replisims"
  local_prefix  = "${local.project}-${var.environment}"
  global_prefix = "${local.project}-${var.environment}"

  tags = {
    Project     = local.project
    Environment = var.environment
    Terraform   = "github.com/replisims/website/terraform"
  }
}


#####  Storage

resource "aws_s3_bucket" "website" {
  bucket = "${local.global_prefix}-website"
  tags = local.tags
}

resource "aws_cloudfront_origin_access_identity" "website" {
  comment = "CloudFront OAI for website bucket"
}
data "aws_iam_policy_document" "website_bucket" {
  statement {
    sid = "AllowReadByCloudFront"
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.website.iam_arn]
    }
    resources = [
      aws_s3_bucket.website.arn,
      "${aws_s3_bucket.website.arn}/*",
    ]
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = [true]
    }
  }
}
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website_bucket.json
}


#####  Website

resource "aws_cloudfront_distribution" "website" {
  enabled         = true
  is_ipv6_enabled = true

  tags    = local.tags

  # aliases = [var.domain]

  origin {
    origin_id   = "bucket-${aws_s3_bucket.website.id}"
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.website.cloudfront_access_identity_path
    }
  }

  default_root_object = "index.html"

  custom_error_response {
    error_code            = "404"
    error_caching_min_ttl = "60"
    response_code         = "404"
    response_page_path    = "/404.html"
  }

  default_cache_behavior {
    target_origin_id = "bucket-${aws_s3_bucket.website.id}"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    default_ttl      = "60"
    max_ttl          = "3600"

    viewer_protocol_policy = "redirect-to-https"
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    # TODO domain cert
    cloudfront_default_certificate = true
    ssl_support_method       = "sni-only"
  }
}


#####  DNS
