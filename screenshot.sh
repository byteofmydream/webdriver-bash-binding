#!/usr/bin/env bash
set -x
sessionId=`cat ./sessionId`
url="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId/screenshot"
resp=`curl -s ${url} -H 'Pragma: no-cache' -H 'Origin: '$(./getOpt.sh BASE_URL)':'$(./getOpt.sh PORT) -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'`
echo ${resp} | ./htmlFromScreenshot.sh | cat
