FROM ubuntu:14.04
MAINTAINER 杜龙少 sdvdxl@163.com

RUN rm /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get update && apt-get install -y git openssh-server golang
RUN ["/usr/sbin/service", "ssh", "start"]

VOLUME /gopath
ENV GOPATH /gopath
ENV ROOT_PASS root

RUN echo "root:${ROOT_PASS}" | chpasswd

WORKDIR /gopath

EXPOSE 22 80

CMD ["/bin/bash"]


