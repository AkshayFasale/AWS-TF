module "s3_website" {
  source      = "./modules/s3-website"
  bucket_name = var.bucket_name
  region      = var.aws_region
  tags = {
    Name        = "static-website-bucket"
    Environment = "Production"
  }
}