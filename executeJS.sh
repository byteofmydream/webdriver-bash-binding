#!/usr/bin/env bash
set -x
json=`./wrapJStoJSON.sh "$1" "$2"`
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/execute"
curl "$url" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'  --data "$json"
