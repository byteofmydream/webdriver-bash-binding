#!/usr/bin/env bash
set -x
key=${1}
cat | ./sed.sh "s/\,\"/\n/g" | tr -d '{}' | grep ${key} | ./sed.sh "s/\":/\n/g" | grep -v ${key}  | tr -d '"'
