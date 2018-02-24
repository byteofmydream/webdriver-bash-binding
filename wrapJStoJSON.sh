#!/usr/bin/env bash
jsFld=`pwd`"/js/"
srcFile=${jsFld}${1}".js"
prefix="{\"script\":\""
script=`cat ${srcFile} | tr -d "\n" | sed 's/\"/\\\"/g'`
postfix="\",\"args\":\"$2\"}"
echo ${prefix}${script}${postfix}
