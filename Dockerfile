FROM centos:centos7

WORKDIR /app

RUN yum -y update
RUN yum install -y git
RUN git clone --branch fix_redis_depencies_centos https://github.com/globocom/pnda.git
WORKDIR /app/pnda/mirror

RUN JAVACMD=/usr/bin/java ./create_mirror.sh

RUN rm -rf /tmp/logstash-5.2.2

VOLUME ["/app/pnda/mirror/mirror-dist"]

ENTRYPOINT ls /app/pnda/mirror/mirror-dist
