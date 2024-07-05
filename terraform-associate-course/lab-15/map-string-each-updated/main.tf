resource "aws_subnet" "list_subnet" {
  for_each          = var.env
  vpc_id            = var.vpc_id
  cidr_block        = each.value.ip
  availability_zone = each.value.az
}

#Notes
#Create a "map of maps" to group information per environment