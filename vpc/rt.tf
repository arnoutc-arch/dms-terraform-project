resource "aws_route_table" "source_public" {
  provider = aws.source

  vpc_id = aws_vpc.source.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.source.id
  }
}

resource "aws_route_table_association" "source_public_a" {
  provider = aws.source

  subnet_id      = aws_subnet.source_public_a.id
  route_table_id = aws_route_table.source_public.id
}