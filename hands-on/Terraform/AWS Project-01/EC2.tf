resource "aws_instance" "web" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t3.micro"
  security_groups = [aws_security_group.EC2ssx.id]
  subnet_id = "aws_subnet.public_ssup1.id"
  associate_public_ip_address = true
  key_name = aws_key_pair.rizk.key_name

user_data = base64encode(<<-EOF
          #!/bin/bash
          yum update -y
         yum install -y python3
         echo "Hello, World from ASG" > /home/ec2-user/index.html
         cd /home/ec2-user
         python3 -m http.server 80 &
         EOF
)
  tags = {
    Name = "HSh3poz2"
   }
}