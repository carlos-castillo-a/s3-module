output "bucket_arn" {
  value       = aws_s3_bucket.this[0].arn
  description = "Bucket ARN(s)"
}

output "bucket_name" {
  value       = aws_s3_bucket.this[0].id
  description = "Bucket name(s)"
}