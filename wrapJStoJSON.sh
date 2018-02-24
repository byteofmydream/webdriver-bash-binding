#!/usr/bin/env bash
jsFld=`pwd`"/js/"
srcFile=${jsFld}${1}".js"
cat ${srcFile} | tr -d "\n" | sed 's/\"/\\\"/g'
