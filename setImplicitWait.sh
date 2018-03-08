#!/usr/bin/env bash
timeOut=${1}
sessionId=`cat ./sessionId`
json="{\"ms\":$timeOut}"
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/timeouts/implicit_wait"
response=`curl -s -X "POST" ${url} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data "$json"`
if [ `echo ${response} | cut -d"," -f 2` == "\"status\":0" ]
then
    echo "Implicit Wait has been set to "${timeOut}
    exit 0
else
    echo "Failed to set Implicit Wait"
    exit 1
fi
