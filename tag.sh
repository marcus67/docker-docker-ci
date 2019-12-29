#!/usr/bin/env bash

VERSION=release-0.9

git tag -a ${VERSION} -m "Version ${VERSION}"
git push origin --tags
curl -k https://raw.githubusercontent.com/marcus67/python_base_app/fb_rickert_beethoven/requirements.txt -o assets/requirements.txt
docker build -t marcusrickert/docker-docker-ci:${VERSION}  . $*
