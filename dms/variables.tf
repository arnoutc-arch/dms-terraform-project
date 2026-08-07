variable "dms_username" {
    default = "dms_user"
}

variable "source_cluster_id" {
    default = "aurora-source"
}

variable "source_database" {
    default = "dvdrental"
}

variable "source_port" {
    default = "5432"
}

variable "source_username" {
    default = "postgres"
}

variable "source_password" {
    type = string
    sensitive = true
    default = "Super$ecretPassw0rd"
}

variable "source_sslmode" {
    default = "require"
}

variable "source_schema" {
    default = "public"
}

variable "target_cluster_id" {
    default = "aurora-target"
}

variable "target_cluster_family" {
    default = "aurora-postgresql9.6"
}

variable "target_account" {
    default = "851459781336"
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

variable "dms_password" {
    type = string
    sensitive = true
    default = "Super$ecretPassw0rd"
}

variable "dms_replication_instance_id" {
    default = "aurora-cdc"
}

variable "dms_replication_instance_class" {
    default = "dms.t3.medium"
}

variable "dms_allocated_storage" {
    default = "200"
}

variable "source_cluster_endpoint" {
    type = string
}

variable "target_cluster_endpoint" {
    type = string
}

variable "vpc_id" {
  type = string
}

variable "amazon_linux_ami" {
    default = "ami-02e6c6399b3d63769"
}

variable "aurora_sg_id" {
    default = ""
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_id" {
    type = string
}

variable "aurora_security_group_id" {
    type = string
}

variable "source_aurora_sg_id" {
  type = string
}

variable "target_aurora_sg_id" {
  type = string
}

# run: curl ifconfig.me

variable "myownlaptopIP" {
    default = "217.38.8.142"
}
