FROM index.tenxcloud.com/tenxcloud/ubuntu
MAINTAINER 杜龙少 sdvdxl@163.com

RUN rm /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get update && apt-get install -y git golang

VOLUME /gopath
ENV GOPATH /gopath

WORKDIR /gopath

EXPOSE 22 80
