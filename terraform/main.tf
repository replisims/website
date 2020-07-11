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

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

data "aws_iam_policy_document" "website_bucket" {
  statement {
    sid = "AllowPublicRead"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [
      aws_s3_bucket.website.arn,
      "${aws_s3_bucket.website.arn}/*",
    ]
    actions = [
      "s3:Get*",
      "s3:List*",
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


#####  DNS
