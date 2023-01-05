#!/bin/bash
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com
docker pull 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest

docker stop tomcat-1 || true && docker rm tomcat-1 || true
docker run --name tomcat-1 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
docker stop tomcat-2 || true && docker rm tomcat-2 || true
docker run --name tomcat-2 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
docker stop tomcat-3 || true && docker rm tomcat-3 || true
docker run --name tomcat-3 412937381715.dkr.ecr.ap-northeast-1.amazonaws.com/spring-images:latest
