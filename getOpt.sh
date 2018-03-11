#!/usr/bin/env bash
prop=${1}
result=`cat config.properties | grep ${prop} | cut -d"=" -f 2`
[ -z "${result}" ] && exit 1 || echo "${result}"
