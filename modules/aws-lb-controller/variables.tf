variable "CLUSTER_NAME" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "REGION" {
  description = "AWS region where the EKS cluster is running"
  type        = string
}

variable "CLUSTER_ENDPOINT" {
  description = "EKS Kubernetes API endpoint"
  type        = string
}

variable "CLUSTER_CERTIFICATE_AUTHORITY_DATA" {
  description = "EKS cluster certificate authority data"
  type        = string
}

variable "VPC_ID" {
  description = "VPC ID where the EKS cluster is running"
  type        = string
}