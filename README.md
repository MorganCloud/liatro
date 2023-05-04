# Python Pipeline deployment

Prerequisites:

1)AWS credentials placed in your home folder under .aws/credentials

2)In the app directory of this repo, edit the file ecr_commands.sh `liatro/app/ecr_commands.sh` with the repo name of you choice and image names. If you would like the script to create a repo for you, also uncomment line #9. Run the `./ecr_commands.sh` after editing.

3)In the main directory edit the `run.sh` and enter the abosolute path to the `amazon-eks-cluster` located in this repo to path=. Also edit creds= , with the location of your .aws/credentials file

4)In the `amazon-eks-cluster` directory edit the main.tf file and change the following lines with values for your own aws environment : lines 6,10,21,22

# Deployment

 This is where a Jenkins server gets spun up, a job gets created and it starts a build job. The build will run terraform which will build all the resources for a EKS cluster and then run a kubectl command to deploy the app into the cluster.

 1) Enter the main directory and run `./run.sh`

 2) After the deployment edit the security group inbound rule for the nodes to open port 31479.

# Testing

 1) There is a job in jenkins to do autiomated testing , so you can vist the jenkins server `http://127.0.0.1:8080/job/test/build?delay=0sec` , enter the URL and run the job.

# Clean Up

 1) After deployment , clean is another jenkins job. Visit `http://127.0.0.1:8080/job/destroy/` and run the build, this will run terraform destroy on the environment.
