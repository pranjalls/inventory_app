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
                sh 'docker build -t inventory-app:latest .'
            }
        }
    }
}
