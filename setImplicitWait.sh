#!/usr/bin/env bash
timeOut=${1}
sessionId=`cat ./sessionId`
json="{\"ms\":$timeOut}"
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/timeouts/implicit_wait"
response=`curl -s -X "POST" ${url} -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data "$json"`
isFailed=`echo -n ${response} | ./getFromJSON.sh status`
if [ -z "$isFailed" ]
then
    echo "Failed to set Implicit Wait";
    exit 1;
else
    echo "Implicit Wait has been set to "${timeOut}
    exit 0
fi
