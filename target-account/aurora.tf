resource "aws_rds_cluster" "target" {
    cluster_identifier      = var.target_cluster_id
    engine                  = var.target_engine_family
    engine_version          = var.target_engine_version

    database_name           = var.target_database

    master_username         = var.target_username
    master_password         = var.target_password

    db_subnet_group_name      = aws_db_subnet_group.target.name
    vpc_security_group_ids    = [aws_security_group.target_db.id]

    skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "target_writer" {
    identifier              = var.target_writer_id
    cluster_identifier      = aws_rds_cluster.target.id

    instance_class          = var.target_instance_class
    engine                  = var.target_engine_family
    engine_version          = var.target_engine_version
}

resource "aws_rds_cluster_parameter_group" "target_pg" {
    family                  = var.pg_target_engine_family
    name                    = "${var.target_cluster_id}-pg"

    parameter {
        name                = "rds.logical_replication"
        value               = "1"
        apply_method        = "pending-reboot"
    }

    parameter {
        name                = "wal_sender_timeout"
        value               = "0"
        apply_method        = "pending-reboot"
    }

}

resource "aws_db_subnet_group" "target" {
  name = "target-subnet-group"
  subnet_ids = var.private_subnet_ids
}
