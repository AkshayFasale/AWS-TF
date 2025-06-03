output "website_url" {
  description = "URL of the S3 static website"
  value       = module.s3_website.website_url
}