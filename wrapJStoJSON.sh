#!/usr/bin/env bash

argsArray=$1
#accepts piped in as js file, which gonna be merged with jQuery
mergedJs=`cat | ./insertjQToScript.sh`
#lets drop all newliners and escape semicolumns
mergedJs=`echo -n "$mergedJs" | tr -d "\n" | ./sed.sh 's/\"/\\\"/g'`

prefix="{\"script\":\""
postfix="\",\"args\":[$argsArray]}"

echo -n "$prefix$mergedJs$postfix"
