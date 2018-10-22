FROM centos:centos7

WORKDIR /app
RUN yum update -y \
    && yum install -y \
    git \
    && yum clean all

RUN git clone --branch fix_redis_depencies_centos https://github.com/globocom/pnda.git /app

WORKDIR /app/pnda/mirror
RUN JAVACMD=/usr/bin/java ./create_mirror.sh \
    && rm -rf /tmp/logstash-5.2.2 

VOLUME ["/app/pnda/mirror/mirror-dist"]
ENTRYPOINT ls /app/pnda/mirror/mirror-dist
