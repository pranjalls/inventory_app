pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/pranjalls/inventory-app.git'
            }
        }

        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t inventory-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    // Stop and remove existing container if running
                    sh 'docker stop inventory-app || true'
                    sh 'docker rm inventory-app || true'
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --name inventory-app -p 3000:3000 inventory-app:latest'
            }
        }
    }
}
