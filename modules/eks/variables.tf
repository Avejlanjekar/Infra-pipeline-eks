variable "CLUSTER_NAME" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "SUBNET_IDS" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "NODE_GROUP_NAME" {
  description = "Name of the managed node group"
  type        = string
}

variable "INSTANCE_TYPES" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "DESIRED_SIZE" {
  type    = number
  default = 2
}

variable "MIN_SIZE" {
  type    = number
  default = 1
}

variable "MAX_SIZE" {
  type    = number
  default = 3
}

variable "TAGS" {
  type    = map(string)
  default = {}
}

variable "CLUSTER_VERSION" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}