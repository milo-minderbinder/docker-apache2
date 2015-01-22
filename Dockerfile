FROM mminderbinder/java-jdk7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

ENV HOME /root
CMD ["/sbin/my_init"]


RUN apt-get update && apt-get -y install apache2

# Set up runit script
RUN mkdir /etc/service/apache2
COPY run-apache2.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

# Set up Apache sites
ONBUILD RUN rm /etc/apache2/sites-enabled/*
ONBUILD RUN rm /etc/apache2/sites-available/*
ONBUILD COPY ports.conf /etc/apache2/ports.conf
ONBUILD COPY sites /etc/apache2/sites-available/
ONBUILD RUN a2ensite *

EXPOSE 80

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
