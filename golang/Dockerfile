FROM index.tenxcloud.com/tenxcloud/ubuntu:trusty
MAINTAINER 杜龙少 sdvdxl@163.com

RUN echo 'Asia/Shanghai' > /etc/timezone
RUN rm /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get update && apt-get install -yq git wget
RUN rm -rf /var/cache/apt/archives /var/cache/apt/archives/partial

RUN wget -q http://7rf3a1.com1.z0.glb.clouddn.com/go1.5.1.linux-amd64.tar.gz

RUN tar -xf go1.5.1.linux-amd64.tar.gz -C /usr/local && \
rm go1.5.1.linux-amd64.tar.gz

RUN echo 'export GOPATH=/gopath' >> /etc/profile && \
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> /etc/profile && \
echo 'export GOROOT=/usr/local/go' >> /etc/profile

RUN echo 'export GOPATH=/gopath' >> /root/.bash_profile && \
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> /root/.bash_profile && \
echo 'export GOROOT=/usr/local/go' >> /root/.bash_profile

VOLUME /gopath
ENV GOVERSION 1.5.1
ENV GOROOT /usr/local/go
ENV GOPATH /gopath
ENV PATH $PATH:$GOPATH/bin:$GOROOT/bin

WORKDIR /gopath

EXPOSE 22 80 443
