FROM index.tenxcloud.com/tenxcloud/centos:centos6

MAINTAINER 杜龙少 sdvdxl@163.com

COPY install.sh /root/

RUN chmod +x ~/install.sh

RUN ~/install.sh

WORKDIR $WORKSPACE/transfer/

RUN ./control start

RUN curl -s "http://127.0.0.1:6060/health"

EXPOSE 8433 6071

CMD ./control tail