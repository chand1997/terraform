resource "aws_instance" "expense" {
  count = 3 
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "${var.project}-${var.env}-${var.instance_names[count.index]}"
  }
}

resource "aws_route53_record" "expense" {
  count = 3
  allow_overwrite = true
  zone_id = var.zone_id
  name    = "${var.project}-${var.env}-${var.instance_names[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}

resource "aws_route53_record" "frontend" {
  allow_overwrite = true
  zone_id = var.zone_id
  name    = "${var.project}-${var.env}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip]
}


resource "aws_security_group" "allow_tls" {
  name        = "${var.project}-${var.env}"
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