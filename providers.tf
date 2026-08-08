terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"

        configuration_aliases = [
          aws.target
        ]
    }

    postgresql = {
        source = "cyrilgdn/postgresql"
        version = "~> 1.24"
    }
  }
}

provider "aws" {
  alias = "source"
  region = "eu-west-2"
  profile = var.source_account
}

provider "aws" {
  alias = "target"
  region = "eu-west-2"
  profile = var.target_account
}

provider "postgresql" {
  alias           = "source"
  host            = module.source_account.cluster_endpoint
  port            = var.source_port
  database        = var.source_database
  username        = var.source_username
  password        = var.source_password
  sslmode         = var.source_sslmode
  connect_timeout = 15
  superuser       = false
}

provider "postgresql" {
  alias           = "target"
  host            = module.target_account.cluster_endpoint
  port            = var.target_port
  database        = var.target_database
  username        = var.target_username
  password        = var.target_password
  sslmode         = var.target_sslmode
  connect_timeout = 15
  superuser       = false
}
