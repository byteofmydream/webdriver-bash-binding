#!/usr/bin/env bash
set -x
json=`cat $(pwd)"/js/"${1}".js" | ./wrapJStoJSON.sh "$2" "$3"`
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/execute"
resp=`curl "$url" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'  --data "$json"`
echo ${resp} | ./getFromJSON.sh value