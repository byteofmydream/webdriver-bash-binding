#!/usr/bin/env bash
set -x

sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/execute"
result=`curl "$url" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data '{"script":"return window[\"WebDriverScriptResult\"];","args":[""]}'`

echo ${result} | ./getFromJSON.sh value
