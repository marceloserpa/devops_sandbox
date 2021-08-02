# https://www.elastic.co/guide/en/logstash/current/docker-config.html

FROM docker.elastic.co/logstash/logstash:7.13.4

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/

USER root 

RUN yum -y install wget

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.16.tar.gz \
    -O /usr/share/logstash/mysql-connector-java-8.0.16.tar.gz

RUN tar -xvzf /usr/share/logstash/mysql-connector-java-8.0.16.tar.gz

RUN rm /usr/share/logstash/mysql-connector-java-8.0.16.tar.gz

