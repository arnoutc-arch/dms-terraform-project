# Use VPC peering between source and target account

resource "aws_vpc_peering_connection" "cross_account" {
  provider = aws.source

  vpc_id      = aws_vpc.source.id
  peer_vpc_id = aws_vpc.target.id

  peer_owner_id = var.peer_owner_id

  auto_accept = false
}

# Accept the peering in the target account

resource "aws_vpc_peering_connection_accepter" "accept" {
  provider                          = aws.target
  vpc_peering_connection_id         = aws_vpc_peering_connection.cross_account.id
  auto_accept                       = true
}

resource "aws_vpc" "source" {
  provider = aws.source

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "source-vpc"
  }
}

resource "aws_vpc" "target" {
  provider = aws.target

  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "target-vpc"
  }
}

