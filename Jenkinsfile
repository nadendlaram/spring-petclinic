#!groovy

pipeline {
	agent none
	environment {     
    AWS_ACCOUNT_ID='412937381715'
    AWS_DEFAULT_REGION='ap-northeast-1'
    IMAGE_REPO_NAME='images-jenkins'
    IMAGE_TAG='latest'
    REPOSITORY_URI = '${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}'   
} 
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'sudo docker build -t ${IMAGE_REPO_NAME}:${IMAGE_TAG} .'
      }
    }
    stage('Logging into AWS ECR') {
	agent any
      steps{
        sh 'aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | sudo docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com'
	echo 'Login Completed'             
      }           
    }
    stage('Pushing to ECR') { 
	agent any
      steps{
        sh 'sudo docker tag images-jenkins:latest 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest'
        sh 'sudo docker push 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest'
	echo 'Push Image Completed'       
      }           
    }
  }
} 
