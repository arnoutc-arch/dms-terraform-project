output "cluster_endpoint" {
  value = aws_rds_cluster.target.endpoint
}

output "vpc_id" {
  value = var.vpc_id
}

output "security_group_id" {
  value = aws_security_group.target_db.id
}
