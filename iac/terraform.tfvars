instance_name      = "stg-app-server-instance"
instance_type      = "t3.micro"
ami_id             = "ami-0705384c0b33c194c" # Replace with a valid AMI ID
key_name           = "l00179208_aneeshrp_aws"
sg_name            = "stg-app-security-group"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
