#!/usr/bin/env bash
echo "Hello"
if [[ `uname | tr '[:upper:]' '[:lower:]'` == "linux" ]];
then
    if [[ `uname -m` = *"64"* ]];
    then
        chromedrivers/linux/64/chromedriver --port=4444 --url-base="wd/hub" &
    fi
elif [[ `uname | tr '[:upper:]' '[:lower:]'` == "linux" ]];
then
    if [[ `uname -m` = *"64"* ]];
    then
        chromedrivers/macOS/64/chromedriver --port=4444 --url-base="wd/hub" &
    fi
fi