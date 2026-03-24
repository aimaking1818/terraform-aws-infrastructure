module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.vpc.subnet_id
  vpc_id         = module.vpc.vpc_id 
  instance_type  = var.instance_type
  key_name       = var.key_name
}