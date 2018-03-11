#!/usr/bin/env bash
sessionId=`cat ./sessionId`
url="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId"
response=`curl -s -X "DELETE" ${url} -H 'Pragma: no-cache' -H 'Origin: '$(./getOpt.sh BASE_URL)':'$(./getOpt.sh PORT)`
isFailed=`echo -n ${response} | ./getFromJSON.sh status`
if [ -z "$isFailed" ]
then
    echo "Failed to close browser"
    exit 1;
else
    echo "Browser has been successfully closed"
    exit 0
fi
