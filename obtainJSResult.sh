#!/usr/bin/env bash

sessionId=`cat ./sessionId`
url="${BASE_URL}:${HUB_PORT}/${RELATIVE_URL}/session/$sessionId/execute"
result=`curl -s "$url" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data '{"script":"return window[\"WebDriverScriptResult\"];","args":[""]}'`

echo -n ${result} | ./getFromJSON.sh value
