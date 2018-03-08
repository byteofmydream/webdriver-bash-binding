#!/usr/bin/env bash
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId"
response=`curl -s -X "DELETE" ${url} -H 'Pragma: no-cache' -H 'Origin: http://127.0.0.1:4444'`
isFailed=`echo -n ${response} | ./getFromJSON.sh status`
if [ -z "$isFailed" ]
then
    echo "Failed to close browser"
    exit 1;
else
    echo "Browser has been successfully closed"
    exit 0
fi
