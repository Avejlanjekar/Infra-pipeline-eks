
variable "CLUSTER_NAME" {
  type = string
}

variable "NODE_GROUP_NAME" {
  type = string
}

variable "INSTANCE_TYPE" {
  type = string
}

variable "CLUSTER_VERSION" {
  type = string
}

variable "VPC_NAME" {
  description = "Name of the VPC"
  type        = string
}

variable "VPC_CIDR_BLOCK" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "ENABLE_DNS_HOSTNAMES" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "ENABLE_DNS_SUPPORT" {
  description = "Enable DNS support in the VPC"
  type        = bool
}

variable "VPC_COMMON_TAGS" {
  description = "Common tags for the VPC"
  type        = map(string)
}

variable "COMMON_TAGS" {
  description = "Common tags for the VPC"
  type        = map(string)
}

variable "IGW_NAME" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "PUBLIC_SUBNET_CIDRS" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "APP_SUBNET_CIDRS" {
  description = "CIDR blocks for application subnets"
  type        = list(string)
}

variable "DB_SUBNET_CIDRS" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
}

variable "AVAILABILITY_ZONES" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "PUBLIC_SUBNET_NAME" {
  description = "Base name of public subnets"
  type        = string
}

variable "APP_SUBNET_NAME" {
  description = "Base name of application subnets"
  type        = string
}

variable "DB_SUBNET_NAME" {
  description = "Base name of database subnets"
  type        = string
}

variable "EIP_NAME" {
  description = "Name of the NAT Gateway Elastic IP"
  type        = string
}

variable "NAT_GATEWAY_NAME" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "PUBLIC_ROUTE_CIDR" {
  description = "Destination CIDR for the public route"
  type        = string
}

variable "PRIVATE_ROUTE_CIDR" {
  description = "Destination CIDR for the private route"
  type        = string
}

variable "PUBLIC_RT_NAME" {
  description = "Name of the public route table"
  type        = string
}

variable "PRIVATE_RT_NAME" {
  description = "Name of the private route table"
  type        = string
}

variable "DATABASE_RT_NAME" {
  description = "Name of the database route table"
  type        = string
}

variable "AWS_REGION" {
  type = string
}