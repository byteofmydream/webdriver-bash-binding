#!/usr/bin/env bash
olo=`curl -s "${BASE_URL}:${HUB_PORT}/${RELATIVE_URL}/session" -H "Pragma: no-cache" -H "Origin: ${BASE_URL}:${HUB_PORT}" -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data-binary '{"desiredCapabilities":{"browserName":"chrome"}}' --compressed`
echo "$olo" | ./getFromJSON.sh sessionId | tee sessionId
