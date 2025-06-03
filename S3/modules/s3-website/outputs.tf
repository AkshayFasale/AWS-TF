output "website_url" {
  description = "URL of the S3 static website"
  value       = "http://${aws_s3_bucket.website_bucket.bucket}.s3-website-${var.region}.amazonaws.com"
}