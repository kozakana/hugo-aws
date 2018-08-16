from golang:1.10.3-alpine3.8

MAINTAINER kozakana

RUN apk add git\
    python \
    py-pip \
    groff \
    && pip install awscli

RUN go get -v github.com/spf13/hugo
