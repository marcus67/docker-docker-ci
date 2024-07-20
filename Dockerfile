ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}
MAINTAINER marcus.rickert@web.de

COPY assets/requirements.txt /tmp/

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y  \
       docker-compose \
       git \
       wget \
       curl \
       python-dev-is-python3 \
       expect && \
    pip3 install -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt


