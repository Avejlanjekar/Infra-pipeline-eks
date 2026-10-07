CLUSTER_NAME    = "employee-management-eks-dev"
NODE_GROUP_NAME = "employee-management-ng-dev"
INSTANCE_TYPE   = "t3.small"
CLUSTER_VERSION = "1.33"

VPC_NAME = "eks-vpc-dev"

VPC_CIDR_BLOCK = "10.1.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "dev"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

COMMON_TAGS = {
  Environment = "dev"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

IGW_NAME = "eks-igw-dev"

PUBLIC_SUBNET_CIDRS = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.1.21.0/24",
  "10.1.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "eks-public-subnet-dev"

APP_SUBNET_NAME = "eks-private-app-subnet-dev"

DB_SUBNET_NAME = "eks-private-db-subnet-dev"

EIP_NAME = "eks-nat-eip-dev"

NAT_GATEWAY_NAME = "eks-nat-gateway-dev"

PUBLIC_ROUTE_CIDR = "0.0.0.0/0"

PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME = "eks-public-rt-dev"

PRIVATE_RT_NAME = "eks-private-rt-dev"

DATABASE_RT_NAME = "eks-database-rt-dev"

AWS_REGION = "ap-south-1"