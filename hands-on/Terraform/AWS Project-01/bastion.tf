resource "aws_instance" "bastions" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t3.micro"
  subnet_id = "aws_subnet.public_ssup1.id"
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  security_groups = [aws_security_group.EC2ssx.id]

  tags = {
    Name = "bastions"
   }
}