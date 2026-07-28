pipeline {
    agent any

    options {
        timestamps()
    }

    environment {
        APP_NAME = 'kijanikiosk-payments'
        APP_VERSION = "1.0.${BUILD_NUMBER}"
    }

    stages {

        stage('Lint') {
            steps {
                sh 'npm run lint'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Verify') {
            parallel {

                stage('Test') {
                    steps {
                        sh 'npm test'
                    }
                }

                stage('Security Audit') {
                    steps {
                        sh 'npm audit --audit-level=high || true'
                    }
                }
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }

        stage('Publish') {
            steps {
                echo "Publishing ${APP_NAME} version ${APP_VERSION}"
                sh 'echo "${APP_NAME}-${APP_VERSION}"'
            }
        }
    }

    post {
        always {
            cleanWs()
            echo "Pipeline finished. Status: ${currentBuild.currentResult}"
        }

        success {
            echo "Build completed successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        changed {
            echo "Build status changed."
        }
    }
}