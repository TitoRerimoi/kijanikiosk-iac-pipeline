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

    }

    post {

        changed {
            echo "Build status changed to ${currentBuild.currentResult} - ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }

        always {
            cleanWs()
        }

    }

}
