resource "aws_cloudfront_origin_access_identity" "coai" {
  comment = aws_s3_bucket.s3_bucket.id
}

resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
    origin_id = aws_s3_bucket.s3_bucket.id

    s3_origin_config {
    origin_access_identity = aws_cloudfront_origin_access_identity.coai.cloudfront_access_identity_path
    }
  }

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress = true
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.s3_bucket.id
    cache_policy_id = data.aws_cloudfront_cache_policy.cache_policy.id
  }

  # Cache behavior for images
  ordered_cache_behavior {
    path_pattern     = "/images/*"
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    compress = true
    target_origin_id = aws_s3_bucket.s3_bucket.id
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl                = 1800
    default_ttl            = 1800
    max_ttl                = 1800
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method = "sni-only"
  }

  tags = var.tags
}