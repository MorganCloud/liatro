
# EKS Cluster
module "eks_cluster_and_worker_nodes" {
  source = "./eks"
    # Cluster
  vpc_id = "vpc-0c483edbd4f89e0a5"
  cluster_sg_name = "${var.cluster_name}-cluster-sg"
  nodes_sg_name = "${var.cluster_name}-node-sg"
  eks_cluster_name = var.cluster_name
  eks_cluster_subnet_ids = flatten(["subnet-032844bf32189735d", "subnet-0f736bb4bccfbb835"])
  # Node group configuration (including autoscaling configurations)
  pvt_desired_size = 1
  pvt_max_size = 1
  pvt_min_size = 1
  pblc_desired_size = 1
  pblc_max_size = 1
  pblc_min_size = 1
  endpoint_private_access = true
  endpoint_public_access = true
  node_group_name = "${var.cluster_name}-node-group"
  private_subnet_ids = ["subnet-032844bf32189735d"]
  public_subnet_ids = ["subnet-0f736bb4bccfbb835"]
}