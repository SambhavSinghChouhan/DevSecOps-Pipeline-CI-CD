# EC2
output "ec2_public_ip" {
  value = module.ec2.public_ip
}

# ECR
output "ecr_repository_url" {
  value = module.ecr.repository_url
}

# S3
output "s3_bucket_name" {
  value = module.s3.bucket_name
}