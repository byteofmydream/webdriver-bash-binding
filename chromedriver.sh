#!/usr/bin/env bash
if [ `uname` == "Linux" ]
then
    if [ `uname -m` = *"64"* ]
    then
        chromedrivers/linux/64/chromedriver --port=4444 --url-base="wd/hub" &
    fi
fi
if [ `uname` == "Darwin" ]
then
    if [ `uname -m` = *"64"* ]
    then
        chromedrivers/macOS/64/chromedriver --port=4444 --url-base="wd/hub" &
    fi
fi