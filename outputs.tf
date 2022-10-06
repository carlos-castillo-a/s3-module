output "bucket_arn" {
  value       = join ("", aws_s3_bucket.this.*.arn)
  description = "Bucket ARN(s)"
}

output "bucket_name" {
  value       = join ("", aws_s3_bucket.this.*.arn)
  description = "Bucket name(s)"
}