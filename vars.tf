variable "PROJECT" {}
variable "ENV" {}

//VPC
variable "VPC_CIDR" {}
variable "PUBLIC_SUBNET_CIDR" {}
variable "PRIVATE_SUBNET_CIDR" {}
variable "AZ" {}
variable "DEFAULT_VPC_ID" {}
variable "DEFAULT_VPC_CIDR" {}
variable "DEFAULT_VPC_RT" {}

//rds variables
variable "RDS_ENGINE" {}
variable "RDS_ENGINE_VERSION" {}
variable "RDS_INSTANCE_CLASS" {}
//variable "PRIVATE_SUBNET_ID" {}
variable "RGS_PORT" {}
//variable "ALLOW_SG_CIDR" {}
//variable "VPC_ID" {}
variable "RDS_PG_FAMILY" {}

//docdb
variable "DOCDB_ENGINE" {}
variable "DOCDB_ENGINE_VERSION" {}
variable "DOCDB_INSTANCE_CLASS" {}
variable "DOCDB_PORT" {}
variable "DOCDB_PG_FAMILY" {}