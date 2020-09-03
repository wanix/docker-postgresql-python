ARG postgres_version=11
FROM postgres:$postgres_version
  
MAINTAINER Erwan SEITE <wanix(dot)fr(at)gmail(dot)com>

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y dist-upgrade \
  && apt-get -y install python3 python3-psycopg2 \
  && apt-get -y autoremove \
  && apt-get clean
