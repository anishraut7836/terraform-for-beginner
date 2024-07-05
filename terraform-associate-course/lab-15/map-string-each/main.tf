resource "aws_subnet" "list_subnet" {
  for_each          = var.ip
  vpc_id            = var.vpc_id
  cidr_block        = each.value
  availability_zone = var.us-east-1-azs[0]
}

#Notes
#cidr_block - based on environment It will point to map and create subnet.
#availability_zone -index start with zero so here subnet will provision on "us-east-1a"
#use a for_each to iterate over the map to create multiple subnets in the same AZ. Modify your list_subnet to the following
