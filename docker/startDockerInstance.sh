#!/usr/bin/env bash
cd docker
docker build -t chromewd .
cd ..
docker run -d -p 4444:4444 -p 5900:5900 chromewd
