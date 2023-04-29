
FROM tomcat:8.5-jre8-temurin-focal
COPY target/*.war /usr/local/tomcat/webapps/myweb.war



