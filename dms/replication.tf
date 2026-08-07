resource "aws_dms_replication_instance" "main" {

    depends_on = [
        aws_iam_role_policy_attachment.dms_vpc_role
    ]
    
    replication_instance_id             = var.dms_replication_instance_id
    replication_instance_class          = var.dms_replication_instance_class
    
    replication_subnet_group_id = aws_dms_replication_subnet_group.main.replication_subnet_group_id

    vpc_security_group_ids = [
        aws_security_group.dms.id
    ]

    allocated_storage                   = var.dms_allocated_storage
    publicly_accessible                 = false
    multi_az                            = false


}

resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_id = "aurora-dms"
  replication_subnet_group_description = "aurora-dms-replication-sg"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "aurora-dms-replication-sg"
  }
}
