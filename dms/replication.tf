resource "aws_dms_replication_instance" "main" {

    depends_on = [
        aws_iam_role_policy_attachment.dms_vpc_role
    ]
    
    replication_instance_id             = var.dms_replication_instance_id
    replication_instance_class          = var.dms_replication_instance_class
    allocated_storage                   = var.dms_allocated_storage
    publicly_accessible                 = false
    multi_az                            = false

    vpc_security_group_ids = [
        aws_security_group.dms.id
    ]
}