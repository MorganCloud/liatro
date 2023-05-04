#variable "profile" {
#  description = "AWS profile"
#  type        = string
#  default = "dev"
#}

variable "region" {
  description = "AWS region to deploy to"
  default = "us-west-2"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type = string
  default = "liatro-eks"
}
