#!/usr/bin/env bash
set +x
jsFld=`pwd`"/js/"
argument="\"$2\""
if [ -z "$3" ];
then
echo ""
else
argument=${argument}",\"$3\""
fi
srcFile=`cat ${jsFld}${1}".js"`
jqFile=`cat ${jsFld}"jQCheck.js"`
prefix="{\"script\":\""
script=`echo ${jqFile}${srcFile} | tr -d "\n" | ./sed.sh 's/\"/\\\"/g'`
postfix="\",\"args\":[$argument]}"
echo ${prefix}${script}${postfix}
