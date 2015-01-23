FROM mminderbinder/java-jdk7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

ENV HOME /root
CMD ["/sbin/my_init"]

# Install Apache2
RUN apt-get update && apt-get -y install apache2

# Set up environment variables needed by run-apache2.sh
ENV APACHE_RUN_USER=www-data \
	APACHE_RUN_GROUP=www-data \
	APACHE_PID_FILE=/var/run/apache2.pid \
	APACHE_RUN_DIR=/var/run/apache2 \
	APACHE_LOCK_DIR=/var/lock/apache2 \
	APACHE_LOG_DIR=/var/log/apache2

# Set up runit script
RUN mkdir /etc/service/apache2
COPY run-apache2.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
