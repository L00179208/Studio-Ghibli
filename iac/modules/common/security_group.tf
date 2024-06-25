module "common_security_group" {
  source      = "./modules/common/security_group"
  vpc_id      = module.common_vpc.vpc_id
  name        = "stg-app-security-group"
  description = "Security group for the application"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow SSH from anywhere
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow HTTP from anywhere
    },
    {
      from_port   = 8880
      to_port     = 8885
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow HTTP from anywhere
    },
    {
      from_port   = 9090
      to_port     = 9090
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow HTTP from anywhere
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow HTTP from anywhere
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #Allow HTTP from anywhere
    }
  ]
}
