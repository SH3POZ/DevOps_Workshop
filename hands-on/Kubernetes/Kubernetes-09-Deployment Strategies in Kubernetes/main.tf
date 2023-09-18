# main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "desktop_sg" {
  name_prefix = "desktop-"
}

resource "aws_security_group_rule" "desktop_ingress" {
  security_group_id = aws_security_group.desktop_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_instance" "desktop" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  security_groups = [aws_security_group.desktop_sg.name]
  key_name      = "your-key-pair-name"  # Replace with your key pair name

  tags = {
    Name = "desktop-instance"
  }
}

resource "aws_security_group" "vserver_sg" {
  name_prefix = "vserver-"
}

resource "aws_security_group_rule" "vserver_ingress" {
  security_group_id = aws_security_group.vserver_sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_instance" "vserver" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  security_groups = [aws_security_group.vserver_sg.name]

  tags = {
    Name = "vserver-instance"
  }
}