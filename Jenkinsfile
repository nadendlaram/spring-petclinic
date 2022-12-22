#!groovy

pipeline {
	agent none
  stages {
  	stage('Maven Install') {
    	agent {
      	any {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	echo "hello ramanji"
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
        sh 'sudo docker build -t ramanji/spring-petclinic:latest .'
        sh 'sudo docker -v'
        sh 'sudo docker ps'
        sh 'sudo docker images'
      }
    }
     stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'Venkat@#19', usernameVariable: 'ramanji1912')]) {
        	sudo sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sudo sh 'docker push ramanji/spring-petclinic:latest'
        }
      }
    }
  }
}
