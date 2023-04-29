
FROM tomcat:8.5-jre8-temurin-focal
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps/myweb.war



