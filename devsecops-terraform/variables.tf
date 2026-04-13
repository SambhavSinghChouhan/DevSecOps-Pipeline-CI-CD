variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "key_name" {
  default = "k8s"
}

variable "instance_type" {
  default = "m7i-flex.large"
}

variable "ecr_repo_name" {
  default = "devsecops-repo"
}

variable "bucket_name" {
  default = "devsecops-reports-bucket-12345"
}