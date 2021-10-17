resource "aws_route_table" "lab-rt" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab-igw.id
  }
  tags = {
    Name = "lab-rt"
  }
}

resource "aws_route_table_association" "rt-attch" {
  subnet_id      = aws_subnet.lab-subnet_1.id
  route_table_id = aws_route_table.lab-rt.id
}
