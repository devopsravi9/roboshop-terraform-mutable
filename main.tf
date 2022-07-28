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

//module "subnet" {
//  source = "github.com/devopsravi9/tf-module-vpc"
//  PUBLIC_SUBNET_CIDR = var.PUBLIC_SUBNET_CIDR
//  PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR
//  AZ = var.AZ
//}