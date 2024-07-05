resource "aws_subnet" "list_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.ip[var.environment]
  availability_zone = var.us-east-1-azs[0]
}

#Notes
#cidr_block - based on environment It will point to map and create subnet.
#availability_zone -index start with zero so here subnet will provision on "us-east-1a"
