ENV = "dev"
PROJECT = "roboshop"

//VPC
VPC_CIDR = "10.50.0.0/16"
PUBLIC_SUBNET_CIDR = [ "10.50.0.0/24", "10.50.1.0/24"]
PRIVATE_SUBNET_CIDR = [ "10.50.2.0/24", "10.50.3.0/24"]
AZ = [ "us-east-1a", "us-east-1b"]
DEFAULT_VPC_ID = "vpc-0ee467a809c645459"
DEFAULT_VPC_CIDR = "172.31.0.0/16"
DEFAULT_VPC_RT = "rtb-019135e82660af7cb"

//RDS
RDS_ENGINE = "mysql"
RDS_ENGINE_VERSION = "5.7"
RDS_INSTANCE_CLASS = "db.t3.micro"
RDS_PG_FAMILY = "mysql5.7"
RGS_PORT = 3306

//docdb
DOCDB_ENGINE = "docdb"
DOCDB_ENGINE_VERSION = "4.0.0"
DOCDB_INSTANCE_CLASS = "db.t3.medium"
DOCDB_PG_FAMILY = "docdb4.0"
DOCDB_PORT = 27107

//elasticache
ELASTICACHE_ENGINE = "redis"
ELASTICACHE_ENGINE_VERSION = "6.2"
ELASTICACHE_INSTANCE_CLASS = "cache.t3.small"
ELASTICACHE_PG_FAMILY = "redis6.x"
ELASTICACHE_PORT = 6379
ELASTICACHE_NUM_OF_NODES = 1

//rabbitmq
RABBITMQ_INSTANCE_TYPE = "t3.micro"
RABBITMQ_PORT = 5672
