#!/usr/bin/env bash
#this is example of simple UI test
pkill -9 chrome
sleep 1s
./wd.sh start
sleep 1s
./wd.sh get "http://news.liga.net"
sleep 2s
./wd.sh executeJS "jQCheck"
sleep 2s
./wd.sh click "#menu_item_finance>a"
sleep 3s
