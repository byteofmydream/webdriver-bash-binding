#!/usr/bin/env bash
#this is example of simple UI test
./wd.sh start
sleep 3s
./wd.sh get "https://google.com"
sleep 3s
./wd.sh assertLocation "https://google.com"
./wd.sh quit