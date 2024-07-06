resource "aws_security_group" "main" {
  name   = "core-sg"
  #vpc_id = aws_vpc.vpc.id
   vpc_id = "vpc-0c769806a661044e5"

  ingress {
    description = "Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}