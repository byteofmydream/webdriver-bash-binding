#!/usr/bin/env bash
url=${1}
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/url"
curl -s -X "POST" ${url} -H 'Pragma: no-cache' -H 'Origin: http://127.0.0.1:4444' -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data-binary '{"desiredCapabilities":{"browserName":"chrome"}}' --compressed