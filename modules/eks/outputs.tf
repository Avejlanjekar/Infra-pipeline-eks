output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.this_cluster.name
}

output "cluster_endpoint" {
  description = "EKS Kubernetes API endpoint"
  value       = aws_eks_cluster.this_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  value       = aws_eks_cluster.this_cluster.certificate_authority[0].data
}

output "node_group_name" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.this_node_group.node_group_name
}