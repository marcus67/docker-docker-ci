FROM debian:stretch
MAINTAINER marcus.rickert@web.de

COPY assets/requirements.txt /tmp/

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y  \
       git \
       wget \
       curl \
       python3 \
       python3-dev \
       python3-pip \
       expect && \
    pip3 install -r /tmp/requirements.txt

# See https://docs.docker.com/engine/release-notes/
# and https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/
ARG DOCKER_CLI_VERSION=18.09.0~3-0~debian-stretch

RUN wget -nc -q https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce-cli_${DOCKER_CLI_VERSION}_amd64.deb -O /tmp/docker.deb

# See https://github.com/docker/compose/releases
ARG DOCKER_COMPOSE_VERSION=1.24.0

RUN dpkg -i /tmp/docker.deb || true && \
    DEBIAN_FRONTEND=noninteractive apt-get -f -y install && \
    curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -f /tmp/docker.deb /tmp/requirements.txt
