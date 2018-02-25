#!/usr/bin/env bash
set +x
#accepts piped in as js file, which gonna be merged with jQuery
mergedJs=`cat | ./insertjQToScript.sh`
#lets drop all newliners and escape semicolumns
mergedJs=`echo -n "$mergedJs" | tr -d "\n" | ./sed.sh 's/\"/\\\"/g'`
#arguments are js args
separator=','
lapka=\"
for var in "$@"
do
    if [ -z "$var" ]; then echo; else res+=`echo -n "$lapka$var$lapka$separator"`; fi
done
argsArray=`echo -n ${res%?}`

prefix="{\"script\":\""
postfix="\",\"args\":[$argsArray]}"

echo -n "$prefix$mergedJs$postfix"
