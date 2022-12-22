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
      }
    }
	stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'Venkat@#19', usernameVariable: 'ramanji1912')]) {
        	sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'sudo docker push shanem/spring-petclinic:latest'
        }
      }
    }
  }
}
