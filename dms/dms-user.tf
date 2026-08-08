resource "postgresql_role" "dms_user" {
    name        = var.dms_username
    login       = true
    password    = var.dms_password
}

# Grant connect to database to DMS user

resource "postgresql_grant" "database_connect" {
    database    = var.source_database
    role        = postgresql_role.dms_user.name
    object_type = "database"

    privileges = [
        "CONNECT"
    ]
}

#Grant usage on schema to DMS user

resource "postgresql_grant" "schema_usage" {
    database    = var.source_database
    role        = postgresql_role.dms_user.name
    object_type = "schema"
    schema      = var.source_schema

    privileges = [
        "USAGE"
    ]
}

# Grant read access on all tables in the schema

resource "postgresql_grant" "table_select" {
    database    = var.source_database
    role        = postgresql_role.dms_user.name
    object_type = "table"
    schema      = var.source_schema

    privileges = [
        "SELECT"
    ]
}

# Grant read access to sequences

resource "postgresql_grant" "sequence_access" {
    database    = var.source_database
    role        = postgresql_role.dms_user.name
    object_type = "sequence"
    schema      = var.source_schema

    privileges = [
        "USAGE",
        "SELECT"
    ]
}

# Create a secret in AWS Secrets Manager
resource "aws_secretsmanager_secret" "aurora_password" {
    name = "aurora-master-password"
}

# Store a password
resource "aws_secretsmanager_secret_version" "aurora_password" {
    secret_id = aws_secretsmanager_secret.aurora_password.id

    secret_string = jsonencode(
        {
            username = "postgres",
            password = var.source_password
        }
    )
}

# Get the master password for the source cluster from AWS Secrets Manager
data "aws_secretsmanager_secret_version" "postgres" {
    secret_id = "aurora-master-password"
}

# locals {
#     source_postgres_password = jsondecode(
#         data.aws_secretsmanager_secret_version.postgres.secret_string
#     )["password"]

#     target_postgres_password = jsondecode(
#         data.aws_secretsmanager_secret_version.postgres.secret_string
#     )["password"]

#     dms_postgres_password = jsondecode(
#         data.aws_secretsmanager_secret_version.postgres.secret_string
#     )["password"]
# }