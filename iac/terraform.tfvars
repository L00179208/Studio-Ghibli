instance_name      = "stg-app-server-instance"
instance_type      = "t3.micro"
ami_id             = "ami-0705384c0b33c194c" # Replace with a valid AMI ID
key_name           = "github-deploy-key"
sg_name            = "stg-app-security-group"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
ssh_public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC042k1JrDl4zTM9Bk9EIdOb8v7rK4BL0DE2QyyzIX66V229UXa5DMNhHAZMvV4h8lPm1DE9xXWTVUFLayp8Pj4Er7/wzIe/FC9gppC79AikaQws5t+1yGqxXRpZhwd3Mb6/hpaJYv2urSZJd6MOltMnHDuCb5sRJfkRQsXRRX0oxynZYy6Cr7DmWD7+e9CLKSpNtvJj3gjFP1azgoEDM8llB0Hgv5E2r8By2A33UO+xMNVWti+iG49IJRBYwXYP1qeEE9LPUNb7QzLnBIkTg2OMha5NuAVYsp4RsW7ElWKqbKCW3kesaZcvsA2Alrxe/v8Ww22fgvbH+fqcBz/Sx55aGGgsNCI7/7hFFDD+R0fvnEUodaeg58bZJ6YsM11oNJ58J0zELx8az3uQNXHaa7AOQmS7uhsjvUm3y3PuMOdTvAY9Bsglsmh39dZVZyk9QsZpj5c17m7v8q5ItPU5w77hQx7ua6v28tk8Ksi3M88d2SaI8YiqnDym1eF/XfLb/s= aneeshramakrishnapillai@Aneeshs-MacBook-Pro.local"
