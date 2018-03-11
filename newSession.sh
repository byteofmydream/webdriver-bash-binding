#!/usr/bin/env bash
olo=`curl -s $(./getOpt.sh BASE_URL)':'$(./getOpt.sh PORT)'/'$(./getOpt.sh RELATIVE_URL)'/session' -H 'Pragma: no-cache' -H 'Origin: '$(./getOpt.sh BASE_URL)':'$(./getOpt.sh PORT) -H 'Content-Type: text/plain;charset=UTF-8' -H 'Accept: application/json; charset=utf-8' --data-binary '{"desiredCapabilities":{"browserName":"chrome"}}' --compressed`
echo "$olo" | ./getFromJSON.sh sessionId | tee sessionId
