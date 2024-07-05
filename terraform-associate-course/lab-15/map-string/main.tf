resource "aws_subnet" "list_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.ip["prod"]
  availability_zone = var.us-east-1-azs[0]
}

#Notes
#index start with zero so here subnet will provision on "us-east-1a"