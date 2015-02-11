# mminderbinder/apache2:oracle-java8
# Apache2 with Oracle Java 8 JDK Docker Image
FROM mminderbinder/java-jdk:oracle-java8
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


# Install Apache2
RUN apt-get update && apt-get -y install apache2

# Set up runit script
RUN mkdir /etc/service/apache2
COPY run-apache2.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
