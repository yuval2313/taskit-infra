# Cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.name_prefix}-AmazonEKSClusterRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [   
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" 
}

# Node Group
resource "aws_iam_role" "eks_node_role" {
  name = "${var.name_prefix}-AmazonEKSNodeRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [   
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_worker" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" 
}
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_ecr" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" 
}
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_cni" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy" 
}




