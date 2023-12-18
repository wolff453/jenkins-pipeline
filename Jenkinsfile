 def repository = 'https://github.com/wolff453'


 pipeline {
    agent any
    stages {
        
 stage('Git Clone') {
    steps {
        bat "rd /s /q ${env.JOB_NAME} 2>nul"
        bat "git clone ${repository}/${env.JOB_NAME}"
    }
}
        
        stage('Git checkout') {
            steps {
                bat "cd ${env.JOB_NAME} && git checkout ${env.version}"
            }
        }

        stage('Docker build') {
            steps {
                bat "cd ${env.JOB_NAME} && docker build -t ${env.JOB_NAME}:${env.version} ."
            }
        }
        
       stage('Test code') {
            steps {
                bat "docker run ${env.JOB_NAME}:${env.version} npm run test"
            }
        }
        
        stage('Deploy to ECR') {
            steps {
                bat "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 279797093641.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
                bat "docker tag ${env.JOB_NAME}:${env.version} 279797093641.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
                bat "docker push 279797093641.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline"
            }
        }
    }
}
