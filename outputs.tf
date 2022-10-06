output "bucket_arn" {
  value       = aws_s3_bucket.this[count.index].arn
  description = "Bucket ARN(s)"
}

output "bucket_name" {
  value       = aws_s3_bucket.this[count.index].id
  description = "Bucket name(s)"
}