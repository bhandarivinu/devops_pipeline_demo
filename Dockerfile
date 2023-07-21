FROM servergurus/ubuntu-jdk8
MAINTAINER Vinay Bhandari <bhandarivinu@gmail.com>

# setup WildFly Hi
COPY docker/wildfly-8.2.0.Final /opt/wildfly

# install example app on wildfy
COPY docker/wildfly-spring-boot-sample-1.0.0.war /opt/wildfly/standalone/deployments/

RUN java -version


# Expose the ports we're interested in
EXPOSE 8080 9990 9090

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/wildfly/bin/standalone.sh", "-c", "docker/wildfly-8.2.0.Final/standalone-full.xml", "-b", "0.0.0.0"]
