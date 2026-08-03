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
    default = "PFDevAdmin"
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

variable "source_instance_class" {
    default = "db.t2.medium"
}

variable "source_engine_version" {
    default = "16.4"
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

# Database Target Section

variable "target_account" {
    default = "DevAdmin"
}

variable "target_cluster_id" {
    default = "aurora-target"
}

variable "target_engine_family" {
    default = "aurora-postgresql"
}

variable "target_engine_version" {
    default = "16.4"
}

variable "target_instance_class" {
    default = "db.t2.medium"
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





