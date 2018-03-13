#!/usr/bin/env bash
response=${1}
successMsg=${2}
errorMsg=${3}
isFailed=`echo -n ${response} | ./getFromJSON.sh status`
if [ -n "$isFailed" ]
then
    echo ${2}
    exit 1
else
    echo ${3}
    exit 0
fi