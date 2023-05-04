#!/bin/bash
path=/Users/confluencetrades/Desktop/python/liatro/amazon-eks-cluster
creds=/Users/confluencetrades/.aws/credentials
#bash script
docker build -t jenkins:liatro . && docker run  --name jenkins -it --rm -p 8080:8080 -v \
${path}/:/root/terraform -v \
${creds}:/root/.aws/credentials:ro --detach --platform linux/x86_64 jenkins:liatro

sleep 300
until java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ list-jobs
do
    echo waiting for jenkins server....
    sleep 10
done
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ create-job build < liatro.xml && \
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ create-job test < test.xml && \
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ create-job destroy < destroy.xml && \
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ build build -w