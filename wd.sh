#!/usr/bin/env bash
command=${1}
argument=${2}

if [ "$command" == "start" ]
then
./newSession.sh
fi
if [ "$command" == "quit" ]
then
./close.sh
fi