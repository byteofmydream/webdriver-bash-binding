#!/usr/bin/env bash
set -x
command=${1}
argument=${2}

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
./navigateTo.sh ${2}
exit 0
fi
if [ "$command" == "assertLocation" ]
then
./assertLocation.sh ${2}
exit 0
fi
echo "missing or wrong command provided"
exit 1
