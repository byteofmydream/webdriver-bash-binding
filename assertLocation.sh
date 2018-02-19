#!/usr/bin/env bash
set -x
url=${1}
sessionId=`cat ./sessionId`
hubEP="http://127.0.0.1:4444/wd/hub/session/$sessionId/url"
response=`curl -s ${hubEP} -H 'Accept: application/json; charset=utf-8'`

if [ "$response" == "$url" ]
then
exit 0
fi
echo "URI assertion failed. expected URI: $url, but actual URI is $response"
exit 1