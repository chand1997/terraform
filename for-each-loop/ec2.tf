resource "aws_instance" "web" {
  for_each=var.instances
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = each.key
  }
}

# output "ec2_output" {
#   value       =  resource.aws_instance.web
 
# }

resource "aws_route53_record" "expense" {
  for_each = aws_instance.web
  zone_id = "Z02189981TMASRQY8AQ08"
  name    = each.key=="frontend" ? "chandev.site" : "${each.key}.chandev.site"
  type    = "A"
  ttl     = 1
  records = each.key=="frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
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