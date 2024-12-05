resource "aws_internet_gateway" "gw-01" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main"
  }
}

