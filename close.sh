#!/usr/bin/env bash
sessionId=`cat ./sessionId`
url="${BASE_URL}:${HUB_PORT}/${RELATIVE_URL}/session/$sessionId"
response=`curl -s -X "DELETE" ${url} -H "Pragma: no-cache" -H "Origin: ${BASE_URL}:${HUB_PORT}"`
./log.sh ${response} "Browser has been successfully closed" "Failed to close browser"
