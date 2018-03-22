#!/usr/bin/env bash
url=${1}
sessionId=`cat ./sessionId`
hubEP="${BASE_URL}:${HUB_PORT}/${RELATIVE_URL}/session/$sessionId/url"
json="{\"url\":\"$url\"}"
response=`curl -s -X "POST" ${hubEP} -H "Content-Type: text/plain;charset=UTF-8" -H "Accept: application/json; charset=utf-8"  --data "$json"`
./log.sh ${response} "Navigated to ${url}" "Failed to get ${url}"
