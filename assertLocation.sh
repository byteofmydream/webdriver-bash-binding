#!/usr/bin/env bash
set -x
expectedURI=`echo ${1} | ./normalizeURI.sh`
sessionId=`cat ./sessionId`
hubEP="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId/url"
response=`curl -s ${hubEP} -H 'Accept: application/json; charset=utf-8'`
actualURI=`echo "$response" | ./getFromJSON.sh value | ./normalizeURI.sh`

if [ "$actualURI" == "$expectedURI" ]
then
exit 0
fi
echo "URI assertion failed. expected URI: $expectedURI, but actual URI is $actualURI"
exit 1
