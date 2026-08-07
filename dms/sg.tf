resource "aws_security_group" "bootstrap" {
    name                            = "postgres-bootstrap"
    vpc_id                          = var.vpc_id

    ingress {
        description                 = "SSH from home"
        from_port                   = 22
        to_port                     = 22
        protocol                    = "tcp"
        cidr_blocks                 = ["${var.myownlaptopIP}/32"]
    }
    
    egress {
        from_port                   = 0
        to_port                     = 0
        protocol                    = "-1"
        cidr_blocks                 = ["0.0.0.0/0"]
    }

}

resource "aws_security_group_rule" "aurora_from_bootstrap" {
    type                            = "ingress"
    from_port                       = 5432
    to_port                         = 5432
    protocol                        = "tcp"

    security_group_id               = var.aurora_security_group_id
    source_security_group_id        = aws_security_group.bootstrap.id

}

resource "aws_security_group" "dms" {
  name   = "dms-sg"
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

# resource "aws_security_group_rule" "target_from_dms" {
#   type                     = "ingress"
#   protocol                 = "tcp"
#   from_port                = 5432
#   to_port                  = 5432

#   security_group_id        = var.target_aurora_sg_id
#   source_security_group_id = aws_security_group.dms.id
# }