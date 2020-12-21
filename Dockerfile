FROM alpine
ARG VERSION=latest
RUN apk add --update build-base musl-dev libffi-dev openssl-dev python3 python3-dev py3-pip
RUN pip3 install docker-compose==$VERSION
WORKDIR /work
