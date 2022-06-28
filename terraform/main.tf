/*   Main execution file, usually it has providers configuration */
  
provider "aws" {
  region  = "eu-west-1"
  access_key = var.key_access
  secret_key = var.key_secret
}
resource "aws_s3_bucket" "b" {
  bucket = "mapfre-gitops-arodr21"

  tags = {
    Name  = "arodr21@mapfre.com"
    Owner = "arodr21@mapfre.com"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.b.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  /*
  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
  */
}
