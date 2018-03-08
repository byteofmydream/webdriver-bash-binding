#!/usr/bin/env bash
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId"
response=`curl -s -X "DELETE" ${url} -H 'Pragma: no-cache' -H 'Origin: http://127.0.0.1:4444'`
if [ `echo ${response} | cut -d"," -f 2` == "\"status\":0" ]
then
    echo "Browser has been successfully closed"
    exit 0
else
    echo "Failed to close browser"
    exit 1
fi
