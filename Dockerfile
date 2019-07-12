FROM oraclelinux:7-slim

MAINTAINER Ivan Condori Loayza <ivziete@gmail.com>

ARG release=19
ARG update=3

RUN  yum -y install oracle-release-el7 && \
     yum-config-manager --enable ol7_oracle_instantclient && \
     yum -y install oracle-instantclient${release}.${update}-basic && \
     rm -rf /var/cache/yum

RUN rpm -i https://omnidb.org/dist/2.16.0/omnidb-server_2.16.0-centos7-amd64.rpm
ENTRYPOINT ["/opt/omnidb-server/omnidb-server","--host=0.0.0.0"]
