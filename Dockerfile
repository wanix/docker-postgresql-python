FROM postgres:11

MAINTAINER Erwan SEITE <wanix(dot)fr(at)gmail(dot)com>

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y dist-upgrade \
  && apt-get -y install python3 \
  && apt-get -y autoremove
