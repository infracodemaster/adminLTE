pipeline{
    agent any
      tools {
        jdk 'jdk17'
        maven 'Maven-3'
    }
    stages{
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
            }
        }
        stage("Checkout from SCM"){
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/infracodemaster/adminLTE.git'
            }
        }
        stage("Sonarqube Analysis") {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-secret') {
                        sh '''
                    sonar-scanner \
                        -Dsonar.projectKey=adminLTE_key \
                        -Dsonar.projectName=adminLTE \
                        -Dsonar.sources=. \
                        -Dsonar.language=js \
                        -Dsonar.sourceEncoding=UTF-8
                    '''
                    }
                }
            }
        }
        
        
    }

