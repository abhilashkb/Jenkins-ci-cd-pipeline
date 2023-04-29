
FROM tomcat:8.5-jre8-temurin-focal
COPY ./*.war /usr/local/tomcat/webapps/myweb.war



