output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.instance_public_ip
}

output "sg_id" {
  description = "ID of the security group"
  value       = module.network.sg_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = module.network.public_subnet_id
}
