output "bucket_arn" {
  value = aws_s3_bucket.this[0].arn
}

output "bucket_name" {
  value = aws_s3_bucket.this[0].id
}