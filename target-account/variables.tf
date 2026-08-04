# Database Target Section

variable "target_account" {
    default = "DevAdmin"
}

variable "target_cluster_id" {
    default = "aurora-target"
}

variable "target_writer_id" {
    default = "aurora-target-writer"
}

variable "target_reader_id" {
    default = "aurora-target-reader"
}

variable "target_engine_family" {
    default = "aurora-postgresql"
}

variable "target_engine_version" {
    default = "17.4"
}

variable "target_instance_class" {
    default = "db.t3.medium"
}

variable "pg_target_engine_family" {
    default = "aurora-postgresql17"
}

variable "target_database" {
    default = "dvdrental_replica"
}

variable "target_username" {
    default = "postgres"
}

variable "target_password" {
    type = string
    sensitive = true
    default = "Super$ecretPassw0rd"
}

variable "target_port" {
    default = "5432"
}

variable "target_sslmode" {
    default = "require"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable target_aurora_sg_id {
  type = string
}
