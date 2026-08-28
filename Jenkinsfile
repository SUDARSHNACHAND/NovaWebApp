pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {

                echo 'Checking out source code...'

                checkout scm
            }
        }


        stage('Install Dependencies') {

            steps {

                echo 'Installing Python dependencies...'

                powershell '''
                    python -m pip install --upgrade pip
                    python -m pip install -r requirements.txt
                '''
            }
        }


        stage('Unit Tests') {

            steps {

                echo 'Running unit tests...'

                powershell '''
                    python -m pytest -v
                '''
            }
        }


        stage('Build') {

            steps {

                echo 'Building Flask application...'

                powershell '''
                    if (Test-Path "build") {
                        Remove-Item "build" -Recurse -Force
                    }

                    New-Item -ItemType Directory -Path "build"

                    Copy-Item app.py build/
                    Copy-Item requirements.txt build/
                    Copy-Item README.md build/

                    Copy-Item templates build/templates -Recurse
                    Copy-Item static build/static -Recurse
                '''
            }
        }

    }


    post {

        success {

            echo '================================='
            echo 'CI PIPELINE SUCCESSFUL!'
            echo '================================='

        }

        failure {

            echo '================================='
            echo 'CI PIPELINE FAILED!'
            echo '================================='

        }

    }

}