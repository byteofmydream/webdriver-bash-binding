#!/usr/bin/env bash
set -x
key=${1}
cat | tr ',' '\n' | grep ${key} | sed  's/\":\"/\n/g' | grep -v ${key} | tr '}' '\n' |  ./sed.sh  's/\"//g'
