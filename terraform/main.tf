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
    aws    = "~> 2.55"
    random = "~> 2.2"
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "us"
  region = "us-east-1"
}

provider "random" {}


#####  Global locals

locals {
  project       = "replisims"
  local_prefix  = "${local.project}-${var.environment}"
  global_prefix = "${local.project}-${var.environment}"

  project_domain = "replisims.org"

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

  tags = local.tags

  aliases = [local.project_domain]

  origin {
    origin_id   = "bucket-${aws_s3_bucket.website.id}"
    domain_name = aws_s3_bucket.website.website_endpoint

    custom_header {
      name  = "Referer"
      value = random_password.website_bucket_referer.result
    }

    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = "80"
      https_port             = "443"
      origin_ssl_protocols   = ["TLSv1"]
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

    default_ttl = "60"
    max_ttl     = "3600"

    viewer_protocol_policy = "redirect-to-https"
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.website.arn
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }
}


#####  DNS

locals {
  # TODO  bring the Hosted Zone into terraform and reference a resource attribute here
  project_domain_hosted_zone_id = "Z08462543JWT9S4ES988V"
}

resource "aws_route53_record" "website_root_ip4" {
  zone_id = local.project_domain_hosted_zone_id
  name    = local.project_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website_root_ip6" {
  zone_id = local.project_domain_hosted_zone_id
  name    = local.project_domain
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website_www" {
  zone_id = local.project_domain_hosted_zone_id
  name    = "www.${local.project_domain}"
  type    = "CNAME"

  records = [local.project_domain]
  ttl     = 900
}


#####  SSL

resource "aws_acm_certificate" "website" {
  provider                  = aws.us
  domain_name               = local.project_domain
  subject_alternative_names = ["*.${local.project_domain}"]
  validation_method         = "DNS"
  tags                      = local.tags
}

resource "aws_route53_record" "website_cert_validation" {
  zone_id = local.project_domain_hosted_zone_id
  name    = aws_acm_certificate.website.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.website.domain_validation_options.0.resource_record_type

  records = [aws_acm_certificate.website.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "website" {
  provider                = aws.us
  certificate_arn         = aws_acm_certificate.website.arn
  validation_record_fqdns = [aws_route53_record.website_cert_validation.fqdn]
}
