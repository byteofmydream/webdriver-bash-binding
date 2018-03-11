#!/usr/bin/env bash
url=${1}
sessionId=`cat ./sessionId`
hubEP="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId/url"
json="{\"url\":\"$url\"}"
curl -s -X "POST" ${hubEP} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'  --data "$json"
