#!/usr/bin/env bash
set -x
sessionId=`cat ./sessionId`
url="${BASE_URL}:${HUB_PORT}/${RELATIVE_URL}/session/$sessionId/screenshot"
resp=`curl -s ${url} -H "Pragma: no-cache" -H "Origin: ${BASE_URL}:${HUB_PORT}" -H "Content-Type: text/plain;charset=UTF-8" -H "Accept: application/json; charset=utf-8"`
echo ${resp} | htmlUtils/htmlFromScreenshot.sh | cat
