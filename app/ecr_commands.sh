#!/bin/bash
repo="lia-repository"
image_name="liatroapp"



docker build -t ${image_name}:latest . && \
##create your own repo
#aws ecr create-repository --repository-name ${lia-repository}  --image-scanning-configuration scanOnPush=true --region us-west-2
docker tag ${image_name}:latest 711646487595.dkr.ecr.us-west-2.amazonaws.com/${repo} && \
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 711646487595.dkr.ecr.us-west-2.amazonaws.com/${repo} && \
docker push 711646487595.dkr.ecr.us-west-2.amazonaws.com/${repo}:latest