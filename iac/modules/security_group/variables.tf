variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ingress_cidrs" {
  description = "List of CIDRs for ingress rules"
  type        = list(string)
}

variable "ingress_ports" {
  description = "List of ports for ingress rules"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
}

variable "egress_cidrs" {
  description = "List of CIDRs for egress rules"
  type        = list(string)
}

variable "egress_ports" {
  description = "List of ports for egress rules"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
}
