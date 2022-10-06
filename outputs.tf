output "bucket_arn" {
  value = ["${aws_s3_bucket.s3_bucket.*.arn}"]
  description = "Bucket ARN(s)"
}

output "bucket_name" {
  value = ["${aws_s3_bucket.s3_bucket.*.bucket}"]
  description = "Bucket name(s)"
}