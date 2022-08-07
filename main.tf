module "vpc" {
  source              = "github.com/devopsravi9/tf-module-vpc"
  ENV                 = var.ENV
  PROJECT             = var.PROJECT
  VPC_CIDR            = var.VPC_CIDR
  PUBLIC_SUBNET_CIDR  = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR
  AZ                  = var.AZ
  DEFAULT_VPC_ID      =var.DEFAULT_VPC_ID
  DEFAULT_VPC_CIDR    = var.DEFAULT_VPC_CIDR
  DEFAULT_VPC_RT      =var.DEFAULT_VPC_RT
  PUBLIC_ZONE_ID      = var.PUBLIC_ZONE_ID
  PRIVATE_ZONE_ID     = var.PRIVATE_ZONE_ID
}

module "rds" {
  source              = "github.com/devopsravi9/tf-module-rds"
  ENV                 = var.ENV
  PROJECT             = var.PROJECT
  RDS_ENGINE          = var.RDS_ENGINE
  RDS_ENGINE_VERSION  = var.RDS_ENGINE_VERSION
  RDS_INSTANCE_CLASS  = var.RDS_INSTANCE_CLASS
  PRIVATE_SUBNET_ID   = module.vpc.PRIVATE_SUBNET_ID
  RGS_PORT            = var.RGS_PORT
  VPC_ID              = module.vpc.VPC_ID
  RDS_PG_FAMILY       = var.RDS_PG_FAMILY
  ALLOW_SG_CIDR       = module.vpc.PRIVATE_SUBNET_CIDR
}

module "docdb" {
  source = "github.com/devopsravi9/tf-module-docdb"
  ENV = var.ENV
  PROJECT = var.PROJECT
  DOCDB_ENGINE = var.DOCDB_ENGINE
  DOCDB_ENGINE_VERSION = var.DOCDB_ENGINE_VERSION
  DOCDB_INSTANCE_CLASS = var.DOCDB_INSTANCE_CLASS
  PRIVATE_SUBNET_ID = module.vpc.PRIVATE_SUBNET_ID
  DOCDB_PORT = var.DOCDB_PORT
  VPC_ID = module.vpc.VPC_ID
  DOCDB_PG_FAMILY = var.DOCDB_PG_FAMILY
  ALLOW_SG_CIDR = module.vpc.PRIVATE_SUBNET_CIDR
}

module "elasticache" {
  source = "github.com/devopsravi9/tf-module-elasticache"
  ENV = var.ENV
  PROJECT = var.PROJECT
  ELASTICACHE_ENGINE = var.ELASTICACHE_ENGINE
  ELASTICACHE_ENGINE_VERSION = var.ELASTICACHE_ENGINE_VERSION
  ELASTICACHE_INSTANCE_CLASS = var.ELASTICACHE_INSTANCE_CLASS
  PRIVATE_SUBNET_ID = module.vpc.PRIVATE_SUBNET_ID
  ELASTICACHE_PORT = var.ELASTICACHE_PORT
  VPC_ID = module.vpc.VPC_ID
  ELASTICACHE_PG_FAMILY = var.ELASTICACHE_PG_FAMILY
  ALLOW_SG_CIDR = module.vpc.PRIVATE_SUBNET_CIDR
  NUM_OF_NODES = var.ELASTICACHE_NUM_OF_NODES
}

module "rabbitmq" {
  source = "github.com/devopsravi9/tf-module-rabbitmq"
  ENV = var.ENV
  PROJECT = var.PROJECT
  INSTANCE_TYPE = var.RABBITMQ_INSTANCE_TYPE
  PRIVATE_SUBNET_ID = module.vpc.PRIVATE_SUBNET_ID
  PORT = var.RABBITMQ_PORT
  VPC_ID = module.vpc.VPC_ID
  ALLOW_SG_CIDR = module.vpc.PRIVATE_SUBNET_CIDR
  WORKSTATION_IP = var.WORKSTATION_IP
}

module "LB" {
  source = "github.com/devopsravi9/tf-module-lb"
  ENV                   = var.ENV
  PROJECT               = var.PROJECT
  PUBLIC_SUBNET_ID      = module.vpc.PUBLIC_SUBNET_ID
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
}

module "FRONTEND" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
  COMPONENT             = "frontend"
  PORT                  = 80
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["FRONTEND"]["COUNT"]
  //INSTANCE_COUNT        = 1
  LB_ARN                = module.LB.PUBLIC_LB_ARN
  LB_TYPE               = "public"
}

module "cart" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
  COMPONENT             = "cart"
  PORT                  = 8080
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["CART"]["COUNT"]
  LB_ARN                = module.LB.PRIVATE_LB_ARN
  LB_TYPE               = "private"
}

module "catalogue" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
  COMPONENT             = "catalogue"
  PORT                  = 8080
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["CATALOGUE"]["COUNT"]
  LB_ARN                = module.LB.PRIVATE_LB_ARN
  LB_TYPE               = "private"
}

module "user" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
  COMPONENT             = "user"
  PORT                  = 8080
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["USER"]["COUNT"]
  LB_ARN                = module.LB.PRIVATE_LB_ARN
  LB_TYPE               = "private"
}

module "shipping" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = module.vpc.PRIVATE_SUBNET_CIDR
  COMPONENT             = "shipping"
  PORT                  = 8080
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["SHIPPING"]["COUNT"]
  LB_ARN                = module.LB.PRIVATE_LB_ARN
  LB_TYPE               = "private"
}

module "payment" {
  source = "github.com/devopsravi9/tf-module-mutable-app"
  ENV                   = var.ENV
  PRIVATE_SUBNET_ID     = module.vpc.PRIVATE_SUBNET_ID
  VPC_ID                = module.vpc.VPC_ID
  ALLOW_SG_CIDR         = concat(module.vpc.PRIVATE_SUBNET_CIDR, module.vpc.PUBLIC_SUBNET_CIDR)
  COMPONENT             = "payment"
  PORT                  = 8080
  INSTANCE_TYPE         = "t3.micro"
  WORKSTATION_IP        = var.WORKSTATION_IP
  INSTANCE_COUNT        = var.INSTANCE_COUNT["PAYMENT"]["COUNT"]
  LB_ARN                = module.LB.PRIVATE_LB_ARN
  LB_TYPE               = "private"
}