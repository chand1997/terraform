variable "image_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "env"{

}

variable "project"{
  type = string
  default = "expense"
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
  
}

variable "instance_names"{
  type = list(string)
  default =["mysql","backend","frontend"]
}

variable "domain"{
  default = "chandev.site"
}



variable "zone_id"{
  default = "Z02189981TMASRQY8AQ08"
}


