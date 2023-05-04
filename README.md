# Python Pipeline deployment

Prerequistes:

1)AWS credentials placed in your home folder under .aws/credentials

2)In the app directory of this repo, edit the file ecr_commands.sh `liatro/app/ecr_commands.sh` with the repo name of you choice and image names. If you would like the script to create a repo for you, also uncomment line #9

3)In the main directory edit the `run.sh` and enter the abosolute path to the `amazon-eks-cluster` located in this repo to path=. Also edit creds= , with the location of your .aws/credentials file

4)In the `amazon-eks-cluster` directory edit the main.tf file and change the following lines with values for your own aws environment : lines 6,10,21,22

#Deployment steps

Deployment will be done in two steps, first building the dockerized version of the python app and uploading it to AWS ECR.
 1) Enter the app directory and run ./ecr_commands.sh

 The Second step is where a Jenkins server gets spun up, a job gets created and it starts the build.The build will run terraform which will build all the resources for a EKS cluster and then run a kubectl command to deploy the app to the cluster.

 2) Enter the main directory and run ./run.sh

 3)After the deployment edit the security group inbound rule for the nodes to open port 31479.

 4) Visit the address of the node and port e.g http://34.221.141.198:31479/ to verify successful deployment.