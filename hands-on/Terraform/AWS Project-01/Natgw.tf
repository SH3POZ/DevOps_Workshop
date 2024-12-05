resource "aws_nat_gateway" "Test01" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_ssup2.id

  tags = {
    Name = "gw NAT"
  }
}