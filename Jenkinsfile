 def repository = 'https://github.com/wolff453'

 pipeline {
    agent any
    stages {
        
        stage('Git Clone') {
            steps {
              //  sh "rd /s /q ${env.JOB_NAME} 2>nul"
               sh "rm -r ${env.JOB_NAME}"
               sh "git clone ${repository}/${env.JOB_NAME}"
            }
        }
        
        stage('Git checkout') {
            steps {
                sh "cd ${env.JOB_NAME} && git checkout ${env.version}"
            }
        }

        stage('Docker build') {
            steps {
                sh "cd ${env.JOB_NAME} && docker build -t ${env.JOB_NAME}:${env.version} ."
            }
        }
        
       stage('Test code') {
            steps {
                sh "docker run ${env.JOB_NAME}:${env.version} npm run test"
            }
        }
        
        stage('Deploy to ECR') {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 279797093641.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
                sh "docker tag ${env.JOB_NAME}:${env.version} {{accountId}}.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
                sh "docker push {{accountId}}.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
            }
        }

        stage('EKS deploy') {
            steps {
                sh "aws eks update-kubeconfig --region us-east-1 --name your-cluster-name"
                sh "kubectl apply -f nodejsapp.yaml"
            }
        }
    }
}
