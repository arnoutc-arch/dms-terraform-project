# Database Source Section 

variable "source_cluster_id" {
    default = "aurora-source"
}

variable "source_writer_id" {
    default = "aurora-source-writer"
}

variable "source_cluster_family" {
    default = "aurora-postgresql9.6"
}

variable "source_account" {
    default = "851459781336"
}

variable "source_username" {
    default = "postgres"
}

variable "source_password" {
    type = string
    sensitive = true
    default = "Super$ecretPassw0rd"
}

variable "source_port" {
    default = "5432"
}

variable "source_reader_id" {
    default = "aurora-source-reader"
}

variable "source_engine_family" {
    default = "aurora-postgresql"
}

variable "pg_source_engine_family" {
    default = "aurora-postgresql17"
}

variable "source_instance_class" {
    default = "db.t3.medium"
}

variable "source_engine_version" {
    default = "17.4"
}

variable "source_database" {
    default = "dvdrental"
}

variable "source_sslmode" {
    default = "require"
}

variable "source_schema" {
    default = "public"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

