
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-01.id
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.main_vpc.id

}

resource "aws_route" "Private22" {
  route_table_id            = aws_route_table.PrivateRT.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.Test01.id
}

resource "aws_route_table_association" "Private01" {
  subnet_id      = aws_subnet.Private_ssup1.id
  route_table_id = aws_route_table.PrivateRT.id
}
resource "aws_route_table_association" "Private02" {
  subnet_id      = aws_subnet.Private_ssup2.id
  route_table_id = aws_route_table.PrivateRT.id
}
resource "aws_route_table_association" "public01" {
  subnet_id      = aws_subnet.public_ssup1.id
  route_table_id = aws_route_table.publicRT.id
}
resource "aws_route_table_association" "public02" {
  subnet_id      = aws_subnet.public_ssup2.id
  route_table_id = aws_route_table.publicRT.id
}