resource "aws_security_group" "source_db" {
  name   = "source-db-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "source_from_dms" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 5432
  to_port                  = 5432

  security_group_id        = var.source_aurora_sg_id
  source_security_group_id = aws_security_group.dms.id
}
