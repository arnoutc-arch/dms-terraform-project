resource "aws_internet_gateway" "source" {
  provider = aws.source

  vpc_id = aws_vpc.source.id

  tags = {
    Name = "source-igw"
  }
}