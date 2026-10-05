variable "cluster_name" {
  description = "Name of the shared EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the managed node group"
  type        = string
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}