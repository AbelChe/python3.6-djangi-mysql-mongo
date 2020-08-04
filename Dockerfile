FROM python:3.6-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk upgrade

RUN apk add --update --no-cache mariadb-connector-c-dev && \
    apk add --no-cache --virtual .build-deps mariadb-dev gcc musl-dev

RUN pip --no-cache-dir install django pymysql pymongo mysqlclient -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

RUN apk del .build-deps && \
    rm -rf /tmp/*

EXPOSE 80
