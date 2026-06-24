module "networking" {

  source = "./modules/networking"

  vpc_cidr    = var.vpc_cidr

  subnet_cidr = var.subnet_cidr

}

module "ec2" {

  source = "./modules/ec2"

  vpc_id        = module.networking.vpc_id

  subnet_id     = module.networking.subnet_id

  instance_type = var.instance_type

}

module "s3" {

  source = "./modules/s3"

}