FROM ubuntu:trusty

MAINTAINER rsaraiva

RUN apt-get update && apt-get install -y mysql-server supervisor

# runs init sql during image building
ADD init.sql /tmp/init.sql
ADD run-init.sh /tmp/run-init.sh
RUN /bin/sh /tmp/run-init.sh

# binds to all address
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD ["mysqld"]
