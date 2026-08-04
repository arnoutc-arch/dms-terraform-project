resource "aws_rds_cluster" "source" {
  cluster_identifier        = var.source_cluster_id

  engine                    = var.source_engine_family
  engine_version            = var.source_engine_version

  database_name             = var.source_database
  port                      = var.source_port

  master_username           = var.source_username
  master_password           = var.source_password     

  db_subnet_group_name      = aws_db_subnet_group.source.name
  vpc_security_group_ids    = [aws_security_group.source_db.id]

  skip_final_snapshot       = true
}

resource "aws_rds_cluster_instance" "source_writer" {
  identifier                = var.source_writer_id
  cluster_identifier        = aws_rds_cluster.source.id

  instance_class            = var.source_instance_class
  engine                    = aws_rds_cluster.source.engine

  publicly_accessible       = false
}

resource "aws_rds_cluster_parameter_group" "source_pg" {
    family                  = var.pg_source_engine_family
    name                    = "${var.source_cluster_id}-pg"

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

resource "aws_db_subnet_group" "source" {
  name = "source-subnet-group"
  subnet_ids = var.private_subnet_ids
}

