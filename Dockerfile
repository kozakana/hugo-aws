from alpine:3.10

MAINTAINER kozakana

ENV HUGO_VER=0.58.3

RUN mkdir /root/src \
    && apk add git \
       python \
       py-pip \
       groff \
       nodejs \
       nodejs-npm \
    && pip install awscli

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_extended_${HUGO_VER}_Linux-64bit.tar.gz /tmp
RUN tar -zxvf /tmp/hugo_extended_${HUGO_VER}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && rm -rf /tmp/* \
    && mkdir /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
