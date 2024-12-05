resource "aws_subnet" "public_ssup1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_ssup1"
}
}
resource "aws_subnet" "public_ssup2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_ssup2"
}
}
resource "aws_subnet" "Private_ssup1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_ssup1"
}
}
resource "aws_subnet" "Private_ssup2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.40.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_ssup2"
}
}