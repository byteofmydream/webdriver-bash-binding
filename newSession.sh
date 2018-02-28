#!/usr/bin/env bash
olo=`curl -s 'http://127.0.0.1:4444/wd/hub/session' -H 'Pragma: no-cache' -H 'Origin: http://127.0.0.1:4444' -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data-binary '{"desiredCapabilities":{"browserName":"chrome"}}' --compressed`
echo "$olo" | ./getFromJSON.sh sessionId | tee sessionId
