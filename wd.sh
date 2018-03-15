#!/usr/bin/env bash

#system variables to use for avoiding arguments passing mess

command=${1}
argument=${2}
extraArgument=${3}

if [ "$command" == "start" ]
then
./newSession.sh
exit 0
fi
if [ "$command" == "quit" ]
then
./close.sh
exit 0
fi
if [ "$command" == "get" ]
then
./navigateTo.sh ${argument}
exit 0
fi
if [ "$command" == "screenshot" ]
then
./screenshot.sh > ./screenshot.html
exit 0
fi
if [ "$command" == "assertLocation" ]
then
./assertLocation.sh ${argument}
exit 0
fi
if [ "$command" == "jsScript" ]
then
./executeJSScript.sh ${argument}
exit 0
fi
if [ "$command" == "click" ]
then
./executeJSScript.sh "click" ${argument} > /dev/null
exit 0
fi
if [ "$command" == "type" ]
then
./executeJSScript.sh "type" ${argument} ${extraArgument} > /dev/null
exit 0
fi
if [ "$command" == "getText" ]
then
./executeJSScript.sh "getText" ${argument}
exit 0
fi
if [ "$command" == "getAttribute" ]
then
./executeJSScript.sh "getAttribute" ${argument} ${extraArgument}
exit 0
fi
if [ "$command" == "showAlert" ]
then
./executeJSScript.sh "showAlert" ${argument}
exit 0
fi
if [ "$command" == "inspect" ]
then
./executeJSScript.sh "inspector"
exit 0
fi
if [ "$command" == "close" ]
then
./close.sh
exit 0
fi
echo "missing or wrong command provided"
exit 1
