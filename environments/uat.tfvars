CLUSTER_NAME    = "employee-management-eks-uat"
NODE_GROUP_NAME = "employee-management-ng-uat"
INSTANCE_TYPE   = "t3.small"
CLUSTER_VERSION = "1.33"

VPC_NAME = "eks-vpc-uat"

VPC_CIDR_BLOCK = "10.3.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "uat"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

COMMON_TAGS = {
  Environment = "uat"
  Project     = "eks"
  ManagedBy   = "Terraform"
}

IGW_NAME = "eks-igw-uat"

PUBLIC_SUBNET_CIDRS = [
  "10.3.1.0/24",
  "10.3.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.3.11.0/24",
  "10.3.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.3.21.0/24",
  "10.3.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "eks-public-subnet-uat"

APP_SUBNET_NAME = "eks-private-app-subnet-uat"

DB_SUBNET_NAME = "eks-private-db-subnet-uat"

EIP_NAME = "eks-nat-eip-uat"

NAT_GATEWAY_NAME = "eks-nat-gateway-uat"

PUBLIC_ROUTE_CIDR = "0.0.0.0/0"

PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME = "eks-public-rt-uat"

PRIVATE_RT_NAME = "eks-private-rt-uat"

DATABASE_RT_NAME = "eks-database-rt-uat"

AWS_REGION = "ap-south-1"