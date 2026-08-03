output "cluster_endpoint" {
  value = aws_rds_cluster.target.endpoint
}

output "vpc_id" {
  value = var.vpc_id
}
