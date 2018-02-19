#!/usr/bin/env bash
#this is example of simple UI test
./wd.sh start
sleep 1s
./wd.sh get "https://google.com"
sleep 2s
./wd.sh assertLocation "https://google.com"
./wd.sh quit