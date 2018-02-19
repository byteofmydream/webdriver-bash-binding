#!/usr/bin/env bash
key=${1}
cat | tr ',' '\n' | grep ${key} | tr ':' '\n' | grep -v ${key} | sed  's/\"//g'