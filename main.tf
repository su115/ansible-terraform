provider "aws" {
  profile = "Igor"
  region  = "eu-west-1"
}

resource "aws_instance" "server"{
  ami           = "ami-0a8e758f5e873d1c1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  count = 2
  associate_public_ip_address = true
  key_name = "ansible"
  tags = {
    Name = "Ubuntu-${count.index}"
  }
}

resource "aws_security_group" "ssh" {
  name = "mysecurity_group-sg"
  ingress{
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


output "all_ip"{
value = aws_instance.server.*.public_ip

}






