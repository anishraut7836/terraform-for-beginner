# Terraform Data Block - To Lookup Latest Ubuntu 20.04 AMI Image
data "aws_region" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

locals {
  team = "api_mgmt_dev"
  application = "corp_api"
  server_name = "ec2-dev"
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = local.team
    Owner = local.application
    App = local.server_name
    ec2-region = data.aws_region.current.name
    ami-name = data.aws_ami.ubuntu.name
    image-id = data.aws_ami.ubuntu.image_id
  }
}