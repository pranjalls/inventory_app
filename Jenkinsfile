pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "inventory-app:latest"
        CONTAINER_NAME = "inventory-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/pranjalls/inventory-app.git'
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
                sh "docker build --no-cache -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    // Stop and remove existing container if running
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh "docker run -d --name ${CONTAINER_NAME} -p 3000:3000 ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        failure {
            echo '❌ Build failed. Check logs for details.'
        }
        success {
            echo '✅ Build and deployment completed successfully.'
        }
    }
}
