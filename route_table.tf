resource "aws_route_table" "anami-public-route-table" {
  vpc_id = aws_vpc.anami-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.anami-internet-gateway.id
  }

  tags = {
    Name = "anami-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.anami-subnet-1.id
  route_table_id = aws_route_table.anami-public-route-table.id
}

resource "aws_route_table" "anami-private-route-table" {
  vpc_id = aws_vpc.anami-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.anami-nat-gateway.id
  }

  tags = {
    Name = "anami-private-route-table"
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.anami-subnet-2.id
  route_table_id = aws_route_table.anami-private-route-table.id
}