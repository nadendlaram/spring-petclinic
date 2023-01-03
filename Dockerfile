FROM ubuntu:latest

MAINTAINER hello@gritfy.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt-get update
RUN apt-get install wget -y
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27-fulldocs.tar.gz

RUN gunzip apache-tomcat-10.0.27-fulldocs.tar.gz
RUN tar xf apache-tomcat-10.0.27-fulldocs.tar
RUN mv tomcat-10.0-doc/* /opt/tomcat/.
RUN apt -y install openjdk* -y
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN wget https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
