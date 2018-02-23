#!/usr/bin/env bash
set -x
url=${1}
sessionId=`cat ./sessionId`
hubEP="http://127.0.0.1:4444/wd/hub/session/$sessionId/url"
json="{\"url\":\"$url\"}"
curl -s -X "POST" ${hubEP} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'  --data "$json"
