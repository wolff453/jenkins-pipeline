 pipeline {
    def gitBaseUrl = 'https://github.com/wolff453'
    def jobName = env.JOB_NAME.toLowerCase()
    agent any
    stages {
        stage('Git checkout') {
            steps {
                bat 'git checkout ${env.version}'
            }
        }

        stage('Git Clone') {
            steps {
                bat 'git clone ${gitBaseUrl}/${jobName}'
            }
        }

        stage('Docker build') {
            steps {
                bat 'docker build -t ${jobName}:${env.version} .'
            }
        }
    }
}
