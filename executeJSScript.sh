#!/usr/bin/env bash
#arguments are js args
separator=','
lapka=\"
i=0
for var in "$@"
do
    ((i++))
    if [  "$i" -eq 1 ]; then echo -n ""
    else
    if [ -z "$var" ]; then echo -n ""; else res+=`echo -n "$lapka$var$lapka$separator"`; fi
    fi
done
argsArray=`echo -n ${res%?}`

json=`cat $(pwd)"/js/"${1}".js" | ./wrapJStoJSON.sh "$argsArray"`
sessionId=`cat ./sessionId`
url="`./getOpt.sh BASE_URL`:`./getOpt.sh PORT`/`./getOpt.sh RELATIVE_URL`/session/$sessionId/execute"
resp=`curl -s "$url" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8'  --data "$json"`
sleep 1s
./obtainJSResult.sh
