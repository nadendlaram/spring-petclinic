#This is a sample Image 
FROM ubuntu 
MAINTAINER nadendlaram.devops@gmail.com
RUN apt purge nginx
RUN apt autoremove
RUN apt-get install –y nginx 
CMD [“echo”,”Image created”]
#FROM anapsix/alpine-java
#LABEL maintainer="nadendlaram.devops@gmail.com"
#RUN mkdir ramanji
#RUN cd ramanji
#RUN touch ram1 ram2 ram3 ram4 ram5 ram6 
#RUN ls -al
