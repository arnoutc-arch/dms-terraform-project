resource "aws_dms_endpoint" "source" {
    endpoint_id             = var.source_cluster_id
    endpoint_type           = "source"
    engine_name             = "postgres"
    server_name             = var.source_cluster_endpoint
    port                    = var.source_port
    database_name           = var.source_database
    username                = var.source_username
    password                = var.source_password

    ssl_mode                = "require"
}

resource "aws_dms_endpoint" "target" {
    endpoint_id             = var.target_cluster_id
    endpoint_type           = "target"
    engine_name             = "postgres"
    server_name             = var.target_cluster_endpoint
    port                    = var.target_port
    database_name           = var.target_database
    username                = var.target_username
    password                = var.target_password
    
    ssl_mode                = "require"
}
