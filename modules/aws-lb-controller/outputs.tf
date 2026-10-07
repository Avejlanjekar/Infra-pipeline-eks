output "IAM_ROLE_ARN" {
  description = "IAM role ARN used by AWS Load Balancer Controller"
  value       = aws_iam_role.this.arn
}

output "SERVICE_ACCOUNT_NAME" {
  description = "Kubernetes service account used by AWS Load Balancer Controller"
  value       = kubernetes_service_account.this.metadata[0].name
}

output "HELM_RELEASE_NAME" {
  description = "Helm release name"
  value       = helm_release.this.name
}