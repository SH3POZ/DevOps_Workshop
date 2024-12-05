resource "aws_s3_bucket" "cloudkodessdf3" {
  bucket = "coudkodessdf3"
  force_destroy = true
  tags = {
    Name = "cloudkodessdf3"
  }
}
resource "aws_iam_policy" "cloudkode_s3_policy" {
  name        = "Cloudkode_S3_Policy"
  description = "Policy for accessing the Cloudkode_s3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
        Resource  = [
          "arn:aws:s3:::cloudkodessdf3",     
          "arn:aws:s3:::cloudkodessdf3/*"    
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example_role_policy_attachment" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.cloudkode_s3_policy.arn

}
