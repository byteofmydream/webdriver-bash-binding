#!/usr/bin/env bash
prefix="<img src=\"data:image/png;base64,"
base64=`cat | ../getFromJSON.sh value | cat`
postfix="\"/>"
echo "$prefix$base64$postfix"
