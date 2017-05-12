FROM ubuntu:16.04

MAINTAINER Chad Williamson <chad@dahc.us>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential dnsutils dstat emacs file git golang \
                       iproute2 iputils-ping irb ldap-utils lsof man-db \
                       manpages mercurial mysql-client nano net-tools netcat \
                       nodejs screen tcpdump telnet tmux traceroute tree vim

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    echo 'deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse' \
      | tee /etc/apt/sources.list.d/mongodb-3.4.list && \
    apt-get update && \
    apt-get install -y mongodb-org-shell

RUN echo 'while true; do sleep 3600; done' > /root/stayup.sh

CMD ["/bin/bash", "/root/stayup.sh"]
