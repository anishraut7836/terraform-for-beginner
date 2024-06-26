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
  }
}