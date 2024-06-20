resource "aws_instance" "webserver" {
    ami = "ami-0edb43b6fa892279"  
    instance_type = "t2.micro"
    tags = {
      Name = "webserver"
      Description = "An Nginx Webserver on Ubuntu"
    }
    provisioner "local-exec" {
      command = "echo ${aws_instance.webserver.public.ip} >> /tmp/ips.txt"
    }
    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [aws_security_group.ssh-access.id]

}

#existing key pair
resource "aws_key_pair" "web" {
    public_key = file("/root/.ssh/web.pub")
  
}


resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow SSH access from the internet"
    ingress = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

output "publicip" {
    value = aws_instance.webserver.public_ip
  
}