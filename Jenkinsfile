pipeline {

    agent any

    environment {
        NODE_ENV = 'test'
        BUILD_DIR = 'dist'
        APP_NAME = 'kijanikiosk-payments'
    }

    options {
        timeout(time: 15, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()
        timestamps()
    }

    stages {

        stage('Lint') {
            steps {
                sh '''
                    echo "========== LINT =========="
                    npm run lint
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo "========== BUILD =========="
                    npm ci
                    npm run build

                    if [ ! -d dist ]; then
                        echo "ERROR: Build output directory not found!"
                        exit 1
                    fi
                '''
            }
        }

        stage('Verify') {
            parallel {

                stage('Test') {
                    steps {
                        sh '''
                            echo "========== TEST =========="
                            npm test
                        '''
                    }
                }

                stage('Security Audit') {
                    steps {
                        sh '''
                            echo "========== SECURITY AUDIT =========="
                            npm audit --audit-level=high
                        '''
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
                echo "========== PUBLISH =========="
                echo "Publishing ${APP_NAME}"
                echo "Nexus publish placeholder"
            }
        }

    }

    post {

        success {
            echo "Pipeline completed successfully."
        }

        failure {
            echo "Pipeline failed. Review the Jenkins console output."
        }

        changed {
            echo "Build status changed to ${currentBuild.currentResult} - ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }

        always {
            cleanWs()
        }

    }

}
