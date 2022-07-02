#!/usr/bin/env bash

# See https://stackoverflow.com/questions/1404796/how-to-get-the-latest-tag-name-in-current-branch-in-git
VERSION=$(git describe --abbrev=0)

curl -k https://raw.githubusercontent.com/marcus67/python_base_app/master/requirements.txt -o assets/requirements.txt
docker build -t marcusrickert/docker-docker-ci:${VERSION}  . $*
