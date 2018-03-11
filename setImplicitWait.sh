#!/usr/bin/env bash
timeOut=${1}
sessionId=`cat ./sessionId`
json="{\"ms\":$timeOut}"
url="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId/timeouts/implicit_wait"
response=`curl -s -X "POST" ${url} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data "$json"`
./log.sh ${response} "Implicit Wait has been set to ${timeOut} ms" "Failed to set Implicit Wait"
