#!/usr/bin/env bash
command=${1}
shift

#arguments taken from bindings file
arr1=($(cat bindings | grep "|"${command}"|" | ./sed.sh "s/|$command|//" | ./sed.sh "s/|/.sh|/" | tr "|" " "))
#arguments taken from args passed to this script
arr2=($(echo -n ${@} | tr " " "\n"))
bashCmd=`echo -n "bash ./wdAPI/"${arr1[@]}" "${arr2[@]}`
${bashCmd}

