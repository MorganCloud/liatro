terraform {
  backend "s3" {
    bucket = "liatrodemo"
    key = "liatrodemo/terraform.tfstate"
    region = "us-west-2"
#    dynamodb_table = "mig-aws-eks-cluster-tf-state"
#    encrypt = true
  }
}