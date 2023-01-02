resource "aws_lambda_function" "invalidate-cloudfront" {
  filename                       = "${path.module}/python/invalidate-cloudfront-python.zip"
  function_name                  = "Invalidate_CloudFront_Lambda_Function"
  role                           = aws_iam_role.lambda_role.arn
  handler                        = "invalidate-cloudfront.lambda_handler"
  runtime                        = "python3.8"
  depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}