FROM anapsix/alpine-java
LABEL maintainer="nadendlaram.devops@gmail.com"
RUN apt-get install tree
RUN mkdir ramanji
RUN cd ramanji
RUN touch ram1 ram2 ram3 ram4 ram5 ram6 
RUN ls -al
