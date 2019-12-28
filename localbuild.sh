#!/usr/bin/env bash

curl -k https://raw.githubusercontent.com/marcus67/python_base_app/fb_rickert_beethoven/requirements.txt -o assets/requirements.txt
docker build -t marcusrickert/docker-docker-ci:latest  . $*
