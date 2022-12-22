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
      	sh 'docker build -t ramanji/spring-petclinic:latest Dockerfile'
      }
    }
  }
}
