module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
}

module "ecr" {
  source = "./modules/ecr"

  repo_name = var.ecr_repo_name
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = module.vpc.public_subnet_id
  vpc_id    = module.vpc.vpc_id

  ecr_url   = module.ecr.repository_url
  bucket    = module.s3.bucket_name
}