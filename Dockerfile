## -*- docker-image-name: "sdotz/hbase-standalone" -*-
FROM alpine:3.4
MAINTAINER Stephen Dotz stephen.dotz@nytimes.com

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre/

RUN apk add --no-cache wget
#Hbase start scrips depend on bash
RUN apk add --no-cache bash
RUN apk add --no-cache openjdk8-jre

RUN mkdir /opt
RUN wget -q http://apache.claz.org/hbase/1.2.2/hbase-1.2.2-bin.tar.gz -O /opt/hbase-1.2.2.tar.gz
RUN cd /opt && tar xfvz hbase-1.2.2.tar.gz && rm hbase-1.2.2.tar.gz
RUN ln -s /opt/hbase-1.2.2 /opt/hbase
RUN /opt/hbase/bin/hbase-config.sh

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD start-pseudo-distributed.sh /opt/hbase/bin/start-pseudo-distributed.sh

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

WORKDIR /opt/hbase/bin

ENV PATH=$PATH:/opt/hbase/bin

CMD /opt/hbase/bin/start-pseudo-distributed.sh

