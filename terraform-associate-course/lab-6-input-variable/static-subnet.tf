resource "aws_subnet" "static-subnet" {
  vpc_id                  = "vpc-01bc5eddb8ddc1e95"
  cidr_block              = "10.0.250.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name      = "sub-variables-us-east-1a"
    Terraform = "true"
  }
}