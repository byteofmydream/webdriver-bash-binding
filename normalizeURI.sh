#!/usr/bin/env bash
#add closing slash symbol after actual and expected URI's
slash="/"
uri=`cat`
lastChar=${uri: -1}

if [ "$lastChar" != "$slash" ]
then
uri=${uri}"/"
fi
echo ${uri}