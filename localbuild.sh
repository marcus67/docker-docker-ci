#!/usr/bin/env bash
PYTHON_VERSION=3.11
curl -k https://raw.githubusercontent.com/marcus67/python_base_app/master/requirements.txt -o assets/requirements.txt
docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} -t marcusrickert/docker-docker-ci:${PYTHON_VERSION}  . $*
