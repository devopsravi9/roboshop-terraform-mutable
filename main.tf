module "vpc" {
  source = "github.com/devopsravi9/tf-module-vpc"
  ENV = var.ENV
  PROJECT = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
}
