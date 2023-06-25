output "bucket_arn" {
  value       = ["${aws_s3_bucket.this.*.arn}"]
  description = "Bucket ARN(s)"
}

output "bucket_name" {
  value       = ["${aws_s3_bucket.this.*.bucket}"]
  description = "Bucket name(s)"
}