data "aws_eks_cluster" "this" {
  name = var.CLUSTER_NAME
}

data "tls_certificate" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.this.certificates[0].sha1_fingerprint
  ]
}

resource "aws_iam_policy" "this" {
  name = "${var.CLUSTER_NAME}-AWSLoadBalancerControllerIAMPolicy"

  policy = file("${path.module}/iam-policy.json")
}

data "aws_iam_policy_document" "this_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.this.arn
      ]
    }

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    condition {
      test     = "StringEquals"
      variable = "${replace(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:aws-load-balancer-controller"
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  name = "${var.CLUSTER_NAME}-aws-load-balancer-controller"

  assume_role_policy = data.aws_iam_policy_document.this_assume_role.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "kubernetes_service_account" "this" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.this.arn
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.this
  ]
}

resource "helm_release" "this" {
  name      = "aws-load-balancer-controller"
  namespace = "kube-system"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  set = [
    {
      name  = "clusterName"
      value = var.CLUSTER_NAME
    },
    {
      name  = "region"
      value = var.REGION
    },
    {
      name  = "vpcId"
      value = var.VPC_ID
    },
    {
      name  = "serviceAccount.create"
      value = "false"
    },
    {
      name  = "serviceAccount.name"
      value = kubernetes_service_account.this.metadata[0].name
    }
  ]

  depends_on = [
    kubernetes_service_account.this
  ]
}
