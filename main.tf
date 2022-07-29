module "vpc" {
  source = "github.com/devopsravi9/tf-module-vpc"
  ENV = var.ENV
  PROJECT = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
  PUBLIC_SUBNET_CIDR = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR
  AZ = var.AZ
  DEFAULT_VPC_ID =var.DEFAULT_VPC_ID
  DEFAULT_VPC_CIDR = var.DEFAULT_VPC_CIDR
  DEFAULT_VPC_RT =var.DEFAULT_VPC_RT
}

module "rds" {
  source = "github.com/devopsravi9/tf-module-rds"
  ENV = var.ENV
  PROJECT = var.PROJECT
  ENGINE = var.ENGINE
  ENGINE_VERSION = var.ENGINE_VERSION
  RDS_INSTANCE_CLASS = var.RDS_INSTANCE_CLASS
  PRIVATE_SUBNET_ID = module.vpc.PRIVATE_SUBNET_ID
  RGS_PORT = var.RGS_PORT
  VPC_ID = module.vpc.VPC_ID
  PG_FAMILY = var.PG_FAMILY
  ALLOW_SG_CIDR = module.vpc.PRIVATE_SUBNET_ID
}