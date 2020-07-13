#####  Backend

terraform {
  backend "remote" {
    organization = "replisims"

    workspaces {
      name = "website-production"
    }
  }
}


#####  Plugins and versions

terraform {
  required_version = "~> 0.12.16"

  required_providers {
    aws      = "~> 2.55"
    random   = "~> 2.2"
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "random" {}


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

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "random_password" "website_bucket_referer" {
  length  = 20
  special = false
}
data "aws_iam_policy_document" "website_bucket" {
  statement {
    sid = "AllowReadByCloudFront"
    principals {
      type        = "AWS"
      identifiers = ["*"]
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
    condition {
      test     = "Bool"
      variable = "aws:Referer"
      values   = [random_password.website_bucket_referer.result]
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
    domain_name = aws_s3_bucket.website.website_domain

    custom_header {
      name = "Referer"
      value = random_password.website_bucket_referer.result
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
    # TODO  domain cert
    cloudfront_default_certificate = true
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1"
  }
}


#####  DNS
