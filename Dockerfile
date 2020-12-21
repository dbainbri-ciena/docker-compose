#  Copyright 2020 Ciena Corporation
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

ARG BASE_IMAGE=alpine:3.12
FROM $BASE_IMAGE
ARG VERSION=latest
RUN apk add --no-cache --update --virtual .build-deps \
        build-base musl-dev libffi-dev openssl-dev \
        python3 python3-dev py3-pip && \
        pip3 install --no-cache-dir docker-compose==$VERSION && \
        apk del .build-deps
WORKDIR /work
