resource "aws_instance" "web" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = var.name
  }
}

output "ec2_output"{
  value= "Public ip: ${aws_instance.web.public_ip} Private ip:${aws_instance.web.private_ip}"
}





resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  


  tags = {
    Name = "allow_tls"
  }
}