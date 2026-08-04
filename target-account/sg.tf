resource "aws_security_group_rule" "target_from_dms" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 5432
  to_port                  = 5432

  security_group_id        = var.target_aurora_sg_id
  source_security_group_id = aws_security_group.dms.id
}