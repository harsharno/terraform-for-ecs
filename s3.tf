resource "aws_s3_bucket" "prod-bucket-public" {
  bucket = lower("${var.app_name}-prod-public-bucket")
}

resource "aws_s3_bucket_policy" "pub_bucket_policy" {
  bucket = aws_s3_bucket.prod-bucket-public.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1628138447875",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${lower(var.app_name)}-prod-public-bucket/*"
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_acl" "bucketaclpub" {
  bucket = aws_s3_bucket.prod-bucket-public.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "prod-bucket-private" {
  bucket = lower("${var.app_name}-prod-private-bucket")
}

resource "aws_s3_bucket_acl" "bucketaclpriv" {
  bucket = aws_s3_bucket.prod-bucket-private.id
  acl    = "private"
}