#!/usr/bin/env bash
set -x
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
if [ "$command" == "executeJS" ]
then
./executeJS.sh ${argument}
exit 0
fi
if [ "$command" == "click" ]
then
./executeJS.sh "click" ${argument}
exit 0
fi
if [ "$command" == "type" ]
then
./executeJS.sh "type" ${argument} ${extraArgument}
exit 0
fi
echo "missing or wrong command provided"
exit 1
