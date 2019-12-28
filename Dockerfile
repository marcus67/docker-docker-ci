FROM debian:stretch-slim
MAINTAINER marcus.rickert@web.de

COPY assets/requirements.txt /tmp/

# See https://docs.docker.com/engine/release-notes/
ARG DOCKER_VERSION=19.03.5

# See https://github.com/docker/compose/releases
ARG DOCKER_COMPOSE_VERSION=1.24.0

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y  \
       git \
       wget \
       curl \
       python3 \
       python3-dev \
       python3-pip \
       expect && \
    pip3 install -r /tmp/requirements.txt && \
    wget -nc -q https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_${DOCKER_VERSION}~ce-0~debian_amd64.deb -O /tmp/docker.deb && \
    dpkg -i /tmp/docker.deb || true && \
    DEBIAN_FRONTEND=noninteractive apt-get -f -y install && \
    curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -f /tmp/docker.deb /tmp/requirements.txt
