resource "aws_instance" "postgres_bootstrap" {
    ami = var.amazon_linux_ami
    instance_type = "t3.micro"
    subnet_id = var.private_subnet_ids[0]
    vpc_security_group_ids = [aws_security_group.bootstrap.id]

    user_data = templatefile(
        "${path.module}/bootstrap.sh",
        {
            source_endpoint = var.source_cluster_endpoint
            source_username = var.source_username
            source_password = var.source_password
            source_database = var.source_database
            source_port = var.source_port
            dms_username = var.dms_username
            dms_password = var.dms_password
            source_schema = var.source_schema
        }
    )

    tags = {
        Name = "postgres-bootstrap"
    }
}