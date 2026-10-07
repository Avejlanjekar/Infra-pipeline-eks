CLUSTER_NAME    = "employee-management-eks-prod"
NODE_GROUP_NAME = "employee-management-ng-prod"
INSTANCE_TYPE   = "t3.small"
CLUSTER_VERSION = "1.33"

VPC_NAME = "eks-vpc-prod"

VPC_CIDR_BLOCK = "10.4.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "prod"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

COMMON_TAGS = {
  Environment = "prod"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

IGW_NAME = "eks-igw-prod"

PUBLIC_SUBNET_CIDRS = [
  "10.4.1.0/24",
  "10.4.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.4.11.0/24",
  "10.4.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.4.21.0/24",
  "10.4.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "eks-public-subnet-prod"

APP_SUBNET_NAME = "eks-private-app-subnet-prod"

DB_SUBNET_NAME = "eks-private-db-subnet-prod"

EIP_NAME = "eks-nat-eip-prod"

NAT_GATEWAY_NAME = "eks-nat-gateway-prod"

PUBLIC_ROUTE_CIDR = "0.0.0.0/0"

PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME = "eks-public-rt-prod"

PRIVATE_RT_NAME = "eks-private-rt-prod"

DATABASE_RT_NAME = "eks-database-rt-prod"

AWS_REGION = "ap-south-1"