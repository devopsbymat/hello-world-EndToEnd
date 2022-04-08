
def gitURL = 'https://github.com/devopsbymat/hello-world-EndToEnd.git'
def branchName = 'master'

pipeline {
    agent {
        node {
            label 'd-master'
        }
    }
    parameters {
    string(name: 'imageTag', defaultValue: 'latest', description: 'Enter Docker Image tag')
    string(name: 'dockeruserID', defaultValue: 'rganjaredocker', description: 'Enter docker user id')
    password(name: 'dockerpass', defaultValue: 'Rahul#143', description: 'Enter docker login password')
    string(name: 'targetserver', defaultValue: 'j-slave2-CT', description: 'Enter Target server name ')
    string(name: 'targetserverIP', defaultValue: '15.207.111.20', description: 'Enter Target Server IP ')
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

    stage ("build docker image"){
        steps{
            sh "sudo docker build . -t ${dockeruserID}/tomcat_regapp:${imageTag}"
            sh "docker images"
        }
    }

    stage('Docker Login&Push'){
        steps{
          sh "sudo docker login --username ${dockeruserID} --password ${dockerpass}"
          sh "sudo docker push ${dockeruserID}/tomcat_regapp:${imageTag}"
        }
    }

    stage('Docker Deployment'){
        steps{
          sh "sudo docker run -itd --name regapp-server -p 8089:8080 ${dockeruserID}/tomcat_regapp:${imageTag}"
        }
    }

    }
}
