resource "aws_subnet" "source_private_a" {
  provider = aws.source

  vpc_id            = aws_vpc.source.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "source-private-a"
  }
}

resource "aws_subnet" "source_private_b" {
  provider = aws.source

  vpc_id            = aws_vpc.source.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "source-private-b"
  }
}

resource "aws_subnet" "target_private_a" {
  provider = aws.target

  vpc_id            = aws_vpc.target.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "target-private-a"
  }
}

resource "aws_subnet" "target_private_b" {
  provider = aws.target

  vpc_id            = aws_vpc.target.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "target-private-b"
  }
}