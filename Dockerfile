FROM centos:latest

RUN yum install tomcat -y
RUN yum install tomcat-webapps tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc -y

RUN yum install maven -y
RUN mvn --version

RUN yum install git -y

RUN git clone https://github.com/Rashid-Hussain-CSE/HelloWorld.git

RUN mvn -f HelloWorld/pom.xml clean install
RUN scp HelloWorld/target/MavenWebApp.war /var/lib/tomcat/webapps/

CMD /usr/libexec/tomcat/server start -DFOREGROUND
