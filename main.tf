
module "eks" {
  source = "./eks"
  vpc_id = ""
  cluster_sg_name = "${var.cluster_name}-cluster-sg"
  nodes_sg_name = "${var.cluster_name}-node-sg"
  eks_cluster_name = var.cluster_name
  eks_cluster_subnet_ids = flatten(["", ""])
  pvt_desired_size = 3
  pvt_max_size = 2
  pvt_min_size = 2
  pblc_desired_size = 1
  pblc_max_size = 2
  pblc_min_size = 1
  endpoint_private_access = true
  endpoint_public_access = true
  node_group_name = "${var.cluster_name}-node-group"
  private_subnet_ids = [""]
  public_subnet_ids = [""]
}