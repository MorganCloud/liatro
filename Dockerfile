FROM --platform=linux/amd64 jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
USER root
RUN apt-get update -y && apt-get install less && apt-get install curl unzip -y && apt-get install wget -y
# AWS CLI installation commands
RUN	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN	unzip awscliv2.zip && ./aws/install
RUN wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
# Unzip
RUN unzip terraform_1.3.7_linux_amd64.zip
# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version
################################
RUN mkdir ~/.aws && mkdir ~/terraform && touch ~/.aws/credentials
##Install Kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

