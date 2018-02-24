#!/usr/bin/env bash
jsFld=`pwd`"/js/"
srcFile=`cat ${jsFld}${1}".js"`
jqFile=`cat ${jsFld}"jQCheck.js"`
prefix="{\"script\":\""
script=`echo ${jqFile}${srcFile} | tr -d "\n" | ./sed.sh 's/\"/\\\"/g'`
postfix="\",\"args\":[\"$2\"]}"
echo ${prefix}${script}${postfix}
