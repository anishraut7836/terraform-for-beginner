
resource "aws_security_group" "main" {
  name   = "core-sg-variable"
  #vpc_id = aws_vpc.vpc.id
   vpc_id = "vpc-0c769806a661044e5"

  dynamic "ingress" {
    for_each = var.web_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }

}