FROM centos:centos7

WORKDIR /app

RUN yum -y update
RUN yum install -y git
RUN git clone --branch fix_redis_depencies_centos git@github.com:globocom/pnda.git
WORKDIR /app/pnda/mirror

RUN JAVACMD=/usr/bin/java ./create_mirror.sh

VOLUME ["/app/pnda/mirror/mirror-dist"]

ENTRYPOINT ls /app/pnda/mirror/mirror-dist
