locals {
  ingress_rules = [{
    port = 443
    description = "Port 443"
  },
  {
    port = 80
    description = "Port 80"
  }
  
  ]
}


resource "aws_security_group" "main" {
  name   = "core-sg-dynamic"
  #vpc_id = aws_vpc.vpc.id
   vpc_id = "vpc-0c769806a661044e5"

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}