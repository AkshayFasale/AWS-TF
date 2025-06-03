# S3 Static Website with Terraform Modules

## I built a Terraform project to deploy an AWS S3 bucket that hosts a static website, accessible via a public URL.
## The bucket serves a simple index.html page saying "Welcome to My Static Site."
## I enabled versioning to prevent accidental file deletions and added a bucket policy to allow public read access.
## Public access settings were configured to make the website work securely, and I used tags to keep things organized. The setup uses a Terraform module