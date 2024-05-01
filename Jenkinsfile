pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/yusufcan65/yudududududu.git']]
                )
                sh 'mvn clean install'
            }
        }
        stage('Stop and Remove Existing Container') {
                                             steps {
                                                 script {
                                                   // Varolan container'ı durdur ve sil
                                                            sh 'docker stop demo-container '
                                                            sh 'docker rm demo-container'
                                                        }
                                                   }
                                        }

        stage('Build docker image'){
            steps{
                script{
                    docker.build("demo/app:${env.BUILD_NUMBER}")
                }
            }
        }



        stage('Run Docker Container') {
                    steps {
                        script {
                            docker.image("demo/app:${env.BUILD_NUMBER}").run("-d -p 6530:6530 --name demo-container")
                        }
                    }
                }

    }

}