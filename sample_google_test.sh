#!/usr/bin/env bash
#this is example of simple UI test
./wd.sh start
./wd.sh get "https://google.com"
./wd.sh assertLocation "https://google.com"
./wd.sh quit