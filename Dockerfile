#This is a sample Image 
FROM ubuntu 
MAINTAINER nadendlaram.devops@gmail.com
RUN apt purge nginx
RUN apt autoremove
RUN apt-get install –y nginx 
CMD [“echo”,”Image created”]
