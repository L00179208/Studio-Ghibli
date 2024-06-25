module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  sg_name            = var.sg_name
}

module "ec2_instance" {
  source          = "./modules/ec2_instance"
  instance_name   = var.instance_name
  instance_type   = var.instance_type
  ami_id          = var.ami_id
  key_name        = var.key_name
  security_groups = [module.network.sg_id]
  subnet_id       = module.network.public_subnet_id
}
