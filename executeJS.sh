#!/usr/bin/env bash
set -x
sessionId=`cat ./sessionId`
url="http://127.0.0.1:4444/wd/hub/session/$sessionId/execute"

