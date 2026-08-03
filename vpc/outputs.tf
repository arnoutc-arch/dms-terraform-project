output "source_private_subnet_ids" {
  value = [
    aws_subnet.source_private_a.id,
    aws_subnet.source_private_b.id
  ]
}

output "target_private_subnet_ids" {
  value = [
    aws_subnet.target_private_a.id,
    aws_subnet.target_private_b.id
  ]
}

output "source_vpc_id" {
  value = aws_vpc.source.id
}

output "target_vpc_id" {
  value = aws_vpc.target.id
}

