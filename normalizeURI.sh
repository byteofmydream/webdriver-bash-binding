#!/usr/bin/env bash
#add closing slash symbol in URI if it's not present
slash="/"
uri=`cat`
lastChar=${uri: -1}
if [ "$lastChar" != "$slash" ]
then
uri=${uri}"/"
fi
echo ${uri}