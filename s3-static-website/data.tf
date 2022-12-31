data "aws_cloudfront_cache_policy" "cache_policy" {
  name = "Managed-CachingDisabled"
}

data "aws_canonical_user_id" "current" {}

data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.s3_bucket.arn,
      "${aws_s3_bucket.s3_bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.coai.iam_arn]
    }
  }
}