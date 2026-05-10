# EC2
output "ec2_public_ip" {
  value = module.ec2.public_ip
}

# ECR
output "ecr_repository_url" {
  value = module.ecr.repository_url
}

