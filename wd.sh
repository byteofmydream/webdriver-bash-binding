#!/usr/bin/env bash
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
