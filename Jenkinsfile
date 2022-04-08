
def gitURL = 'https://github.com/devopsbymat/hello-world-EndToEnd.git'
def branchName = 'master'

pipeline {
    agent {
        node {
            label 'd-master'
        }
    }
    parameters {
    string(name: 'imageTag', defaultValue: 'apache-latest', description: 'Enter Docker Image tag')
    password(name: 'dockerpass', defaultValue: 'Rahul#143', description: 'Enter docker login password ')
    string(name: 'targetserver', defaultValue: 'j-slave2-CT', description: 'Enter Target server name ')
    string(name: 'targetserverIP', defaultValue: '15.207.111.16', description: 'Enter Target Server IP ')
    }

    stages {
    stage('SCM Checkout'){
        steps {
            checkout([$class: 'GitSCM', branches: [[name: "*/${branchName}"]], extensions: [], userRemoteConfigs: [[credentialsId: 'github-Cred', url: "${gitURL}"]]])
        }
    }

    stage ("mvn build"){
        steps{
            sh "mvn clean install"
            sh "ls -ltr"
        }
    }

}
