#!/usr/bin/env bash
sessionId=`cat ./sessionId`
url="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId"
response=`curl -s -X "DELETE" ${url} -H 'Pragma: no-cache' -H 'Origin: '$(./getOpt.sh BASE_URL)':'$(./getOpt.sh PORT)`
./log.sh ${response} "Browser has been successfully closed" "Failed to close browser"
