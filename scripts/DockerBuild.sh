#!/bin/bash
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com
docker pull 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest

#docker stop nodejs-1 || true && docker rm nodejs-1 || true
docker run -p 80:80 --name tomcat-1 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
docker run -p 81:80 --name tomcat-2 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
docker run -p 82:80 --name tomcat-3 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
