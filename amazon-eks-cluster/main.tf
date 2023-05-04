
# EKS Cluster
module "eks_cluster_and_worker_nodes" {
  source = "./eks"
    # Cluster
  vpc_id = ""
  cluster_sg_name = "${var.cluster_name}-cluster-sg"
  nodes_sg_name = "${var.cluster_name}-node-sg"
  eks_cluster_name = var.cluster_name
  eks_cluster_subnet_ids = flatten(["", ""])
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
  private_subnet_ids = [""]
  public_subnet_ids = [""]
}