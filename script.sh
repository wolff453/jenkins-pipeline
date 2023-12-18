#!/bin/bash

# Atualiza o sistema
sudo yum update -y

# Instala o Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker

sudo systemctl start docker


# Instala a AWS CLI
sudo yum install -y aws-cli

sudo aws ecr get-login-password | docker login --username AWS --password-stdin 279797093641.dkr.ecr.us-east-1.amazonaws.com

sudo docker pull 279797093641.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline:latest
# Configuração adicional (opcional): adicione mais comandos conforme necessário

# Reinicia a instância (para aplicar as alterações)
sudo reboot
