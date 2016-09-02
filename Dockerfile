## -*- docker-image-name: "sdotz/hbase-standalone" -*-
FROM alpine:3.4
MAINTAINER Stephen Dotz stephen.dotz@nytimes.com

RUN apk add --no-cache wget
#Hbase start scrips depend on bash
RUN apk add --no-cache bash
RUN apk add --no-cache openjdk8-jre


# install hbase master
RUN mkdir -p /opt/hbase
RUN wget -q http://apache.claz.org/hbase/1.2.2/hbase-1.2.2-bin.tar.gz -O /opt/hbase/hbase-1.2.2.tar.gz
RUN cd /opt/hbase && tar xfvz hbase-1.2.2.tar.gz
ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

ENV JAVA_HOME /usr

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

CMD ["/opt/hbase/hbase-1.2.2/bin/hbase", "master", "start"]
