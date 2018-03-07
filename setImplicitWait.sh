#!/usr/bin/env bash
timeOut=${1}
sessionId=`cat ./sessionId`
json="{\"ms\":$timeOut}"
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/timeouts/implicit_wait"
curl -s -X "POST" ${url} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data "$json"
