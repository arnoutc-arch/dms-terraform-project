resource "aws_route_table" "source_public" {
  provider = aws.source

  vpc_id = aws_vpc.source.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.source.id
  }

  tags = {
    Name = "Source public route table"
  }
}

resource "aws_route_table_association" "source_public_a" {
  provider = aws.source

  subnet_id      = aws_subnet.source_public_a.id
  route_table_id = aws_route_table.source_public.id

}

resource "aws_route_table" "target_public" {
  provider = aws.target

  vpc_id = aws_vpc.target.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.target.id
  }

  tags = {
      Name = "Target public route table"
  }
}

resource "aws_route_table" "source_private" {
  provider = aws.source
  vpc_id = aws_vpc.source.id

  tags = {
    Name = "DMS RDS Source DB private route table"
  }
}

resource "aws_route_table" "target_private" {
  provider = aws.target
  vpc_id = aws_vpc.target.id

  tags = {
    Name = "DMS RDS Target DB private route table"
  }
}

resource "aws_route_table_association" "source_private_a" {
  provider = aws.source

  subnet_id      = aws_subnet.source_private_a.id
  route_table_id = aws_route_table.source_private.id
  
}

resource "aws_route_table_association" "source_private_b" {
  provider = aws.source

  subnet_id      = aws_subnet.source_private_b.id
  route_table_id = aws_route_table.source_private.id
}

resource "aws_route_table_association" "target_private_a" {
  provider = aws.target

  subnet_id      = aws_subnet.target_private_a.id
  route_table_id = aws_route_table.target_private.id
}

resource "aws_route_table_association" "target_private_b" {
  provider = aws.target

  subnet_id      = aws_subnet.target_private_b.id
  route_table_id = aws_route_table.target_private.id
}

# source RDS is in private subnet

resource "aws_route" "source_to_target" {
  provider                  = aws.source
  route_table_id            = aws_route_table.source_private.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.cross_account.id

}

# target RDS is in private subnet

resource "aws_route" "target_to_source" {
  provider                  = aws.target
  route_table_id            = aws_route_table.target_private.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.cross_account.id
}