#!groovy

pipeline {
	agent none
	environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
} 
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
	stage('Login to Docker Hub') { 
		agent any
      steps{                            
	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	echo 'Login Completed'                
      }           
    }
    stage('Push Image to Docker Hub') { 
		agent any
      steps{                            
	sh 'sudo docker push ramanji1912/jenkins:$BUILD_NUMBER' 
	echo 'Push Image Completed'       
      }           
    } 	
  }
}
