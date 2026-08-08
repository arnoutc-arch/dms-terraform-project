module "vpc" {
  source = "./vpc"

  providers = {
    aws.source = aws.source
    aws.target = aws.target
  }
}

module "source_account" {
  source = "./source-account"

  vpc_id = module.vpc.source_vpc_id
  private_subnet_ids = module.vpc.source_private_subnet_ids


  providers = {
    aws = aws.source
  }


}

module "target_account" {
  source = "./target-account"

  vpc_id = module.vpc.target_vpc_id
  private_subnet_ids = module.vpc.target_private_subnet_ids


  providers = {
    aws = aws.target
  }


}

# enable once the vpc, source and target accounts have been created

module "dms" {
  source = "./dms"

  providers = {
    aws        = aws.source
    aws.target = aws.target
    postgresql = postgresql.source
  }

  vpc_id = module.vpc.source_vpc_id
  
  private_subnet_ids = module.vpc.source_private_subnet_ids
  public_subnet_id = module.vpc.source_public_subnet_a_id
  
  aurora_security_group_id = module.source_account.security_group_id
  source_aurora_sg_id = module.source_account.security_group_id
  target_aurora_sg_id = module.target_account.security_group_id

  source_cluster_endpoint = module.source_account.cluster_endpoint
  target_cluster_endpoint = module.target_account.cluster_endpoint
  source_username = var.source_username
  source_password = var.source_password
  source_database = var. source_database
}