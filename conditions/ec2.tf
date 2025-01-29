resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.env_type == "prod" ? "t2.micro" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = var.ec2_tags
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }


  tags = var.sg_tags
}