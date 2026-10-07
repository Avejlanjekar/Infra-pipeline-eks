
module "VPC" {
  source = "./modules/vpc"

  VPC_NAME             = var.VPC_NAME
  VPC_CIDR_BLOCK       = var.VPC_CIDR_BLOCK
  ENABLE_DNS_HOSTNAMES = var.ENABLE_DNS_HOSTNAMES
  ENABLE_DNS_SUPPORT   = var.ENABLE_DNS_SUPPORT
  VPC_COMMON_TAGS      = var.VPC_COMMON_TAGS

  IGW_NAME = var.IGW_NAME

  PUBLIC_SUBNET_CIDRS = var.PUBLIC_SUBNET_CIDRS
  APP_SUBNET_CIDRS    = var.APP_SUBNET_CIDRS
  DB_SUBNET_CIDRS     = var.DB_SUBNET_CIDRS

  AVAILABILITY_ZONES = var.AVAILABILITY_ZONES

  PUBLIC_SUBNET_NAME = var.PUBLIC_SUBNET_NAME
  APP_SUBNET_NAME    = var.APP_SUBNET_NAME
  DB_SUBNET_NAME     = var.DB_SUBNET_NAME

  EIP_NAME         = var.EIP_NAME
  NAT_GATEWAY_NAME = var.NAT_GATEWAY_NAME

  PUBLIC_ROUTE_CIDR  = var.PUBLIC_ROUTE_CIDR
  PRIVATE_ROUTE_CIDR = var.PRIVATE_ROUTE_CIDR

  PUBLIC_RT_NAME   = var.PUBLIC_RT_NAME
  PRIVATE_RT_NAME  = var.PRIVATE_RT_NAME
  DATABASE_RT_NAME = var.DATABASE_RT_NAME
}

module "EKS" {
  source = "./modules/eks"

  CLUSTER_NAME    = var.CLUSTER_NAME
  NODE_GROUP_NAME = var.NODE_GROUP_NAME
  CLUSTER_VERSION = var.CLUSTER_VERSION

  SUBNET_IDS     = module.VPC.APP_SUBNET_IDS
  INSTANCE_TYPES = [var.INSTANCE_TYPE]

  DESIRED_SIZE = 1
  MIN_SIZE     = 1
  MAX_SIZE     = 2

  TAGS = merge(var.COMMON_TAGS, {
    Name = var.CLUSTER_NAME
  })
}

module "AWS_LB_CONTROLLER" {
  source = "./modules/aws-lb-controller"

  CLUSTER_NAME = module.EKS.cluster_name
  REGION       = var.AWS_REGION
  VPC_ID       = module.VPC.VPC_ID

  CLUSTER_ENDPOINT                   = module.EKS.cluster_endpoint
  CLUSTER_CERTIFICATE_AUTHORITY_DATA = module.EKS.cluster_certificate_authority_data

  depends_on = [
    module.EKS
  ]
}