CLUSTER_NAME    = "employee-management-eks-qa"
NODE_GROUP_NAME = "employee-management-ng-qa"
INSTANCE_TYPE   = "t3.small"
CLUSTER_VERSION = "1.33"

VPC_NAME = "eks-vpc-qa"

VPC_CIDR_BLOCK = "10.2.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "qa"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

COMMON_TAGS = {
  Environment = "qa"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

IGW_NAME = "eks-igw-qa"

PUBLIC_SUBNET_CIDRS = [
  "10.2.1.0/24",
  "10.2.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.2.11.0/24",
  "10.2.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.2.21.0/24",
  "10.2.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "eks-public-subnet-qa"

APP_SUBNET_NAME = "eks-private-app-subnet-qa"

DB_SUBNET_NAME = "eks-private-db-subnet-qa"

EIP_NAME = "eks-nat-eip-qa"

NAT_GATEWAY_NAME = "eks-nat-gateway-qa"

PUBLIC_ROUTE_CIDR = "0.0.0.0/0"

PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME = "eks-public-rt-qa"

PRIVATE_RT_NAME = "eks-private-rt-qa"

DATABASE_RT_NAME = "eks-database-rt-qa"

AWS_REGION = "ap-south-1"