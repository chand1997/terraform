data "aws_ami" "my_ami" {
# all the info is in devops-practice ami 
  most_recent      = true 
  owners           = ["973714476881"]



  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "my_vpc"{
    default = true
}

output "vpc_output"{
    value = data.aws_vpc.my_vpc.id
}


output "ami_output"{
    value = data.aws_ami.my_ami.id
}