#!groovy

pipeline {
	agent none
	environment {     
    AWS_ACCOUNT_ID='412937381715'
    AWS_DEFAULT_REGION=5'ap-northeast-1'
    IMAGE_REPO_NAME='spring-images'
    IMAGE_TAG='latest'
    REPOSITORY_URI = '${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}'   
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
    stage('Logging into AWS ECR') {
	agent any
      steps{      
	sh 'sudo aws ecr get-login-password — region ${AWS_DEFAULT_REGION} | docker login — username AWS — password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com'                
	echo 'Login Completed'                
      }           
    }
    stage('Pushing to ECR') { 
	agent any
      steps{                            
	sh 'sudo docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG'
	sh 'sudo docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}'
	echo 'Push Image Completed'       
      }           
    }
  }
} 
