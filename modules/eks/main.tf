resource "aws_iam_role" "this_role" {
  name = "${var.CLUSTER_NAME}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })

  tags = var.TAGS
}


resource "aws_iam_role_policy_attachment" "this_cluster_policy" {
  role       = aws_iam_role.this_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


resource "aws_eks_cluster" "this_cluster" {
  name     = var.CLUSTER_NAME
  role_arn = aws_iam_role.this_role.arn
  version  = var.CLUSTER_VERSION

  vpc_config {
    subnet_ids = var.SUBNET_IDS
  }

  depends_on = [
    aws_iam_role_policy_attachment.this_cluster_policy
  ]

  tags = var.TAGS
}


resource "aws_iam_role" "this_node_group" {
  name = "${var.CLUSTER_NAME}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = var.TAGS
}


resource "aws_iam_role_policy_attachment" "this_worker_node" {
  role       = aws_iam_role.this_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


resource "aws_iam_role_policy_attachment" "this_cni" {
  role       = aws_iam_role.this_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


resource "aws_iam_role_policy_attachment" "this_container_registry" {
  role       = aws_iam_role.this_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}


resource "aws_eks_node_group" "this_node_group" {
  cluster_name    = aws_eks_cluster.this_cluster.name
  node_group_name = var.NODE_GROUP_NAME
  node_role_arn   = aws_iam_role.this_node_group.arn
  subnet_ids      = var.SUBNET_IDS
  instance_types  = var.INSTANCE_TYPES

  scaling_config {
    desired_size = var.DESIRED_SIZE
    min_size     = var.MIN_SIZE
    max_size     = var.MAX_SIZE
  }

  depends_on = [
    aws_iam_role_policy_attachment.this_worker_node,
    aws_iam_role_policy_attachment.this_cni,
    aws_iam_role_policy_attachment.this_container_registry
  ]

  tags = var.TAGS
}