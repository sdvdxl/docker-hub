FROM index.tenxcloud.com/tenxcloud/ubuntu
MAINTAINER 杜龙少 sdvdxl@163.com

RUN rm /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get update && apt-get install -y git wget

RUN wget -q http://7rf3a1.com1.z0.glb.clouddn.com/go1.5.1.linux-amd64.tar.gz

RUN tar -xf go1.5.1.linux-amd64.tar.gz -C /usr/local

RUN echo 'export GOPATH=/gopath' >> /.bashrc && \
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> /.bashrc \
echo 'export GOROOT=/usr/local/go'

VOLUME /gopath
ENV GOVERSION 1.5.1
ENV GOROOT /usr/local/go
ENV GOPATH /gopath
ENV PATH $PATH:$GOPATH/bin:$GOROOT/bin

WORKDIR /gopath

EXPOSE 22 80
