resource "aws_internet_gateway" "source" {
  provider = aws.source

  vpc_id = aws_vpc.source.id

  tags = {
    Name = "source-igw"
  }
}

resource "aws_internet_gateway" "target" {
  provider = aws.target

  vpc_id = aws_vpc.target.id

  tags = {
    Name = "target-igw"
  }
}