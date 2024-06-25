# resource "aws_instance" "microservices" {
#   ami           = "ami-0705384c0b33c194c"
#   instance_type = "t3.micro"
#   tags = {
#     Name = "Microservices Backend"
#   }
#   vpc_security_group_ids = [module.common_security_group.security_group_id]
# }
