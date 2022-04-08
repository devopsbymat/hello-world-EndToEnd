FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
ADD /webapp/target/*.war /usr/local/tomcat/webapps

