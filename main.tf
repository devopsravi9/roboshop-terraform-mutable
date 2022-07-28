module "vpc" {
  source = "github.com/devopsravi9/tf-module-vpc"
  ENV = var.ENV
  PROJECT = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
}

module "subnet" {
  source = "github.com/devopsravi9/tf-module-vpc"
  PUBLIC_SUBNET_CIDR = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR
}