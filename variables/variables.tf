variable "image_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ingress_port" {
  type = number
  default = 22
}

variable "egress_port" {
  type = number
  default = 0
}

variable "sg_tags" {
    type = map
    default = {
    Name = "allow_tls"
  }
}

variable "ec2_tags" {
    type = map
    default = {
     Name = "Variables-demo"
  }
}



# Preference of variables considered

# 1. command line --> Eg: terraform plan -var "instance_type=t3.micro"
# 2. terraform.tfvars file 
# 3. env variable 
#    eg: export TF_VAR_instance_type="t2.micro" (setting env variable)
#        unset TF_VAR_instance_type (removing env variable)
# 4. default values--> above written
# 5. user prompt