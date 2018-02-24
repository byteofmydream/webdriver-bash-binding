#!/usr/bin/env bash
#this is example of simple UI test

pkill -9 chrome
./chromedriver --port=4444 --url-base="wd/hub" &
sleep 5s
./wd.sh start
sleep 3s
./wd.sh get "https://www.google.com"
sleep 1s
./wd.sh type "[name=q]" "ololo"



#pkill -9 chrome
#sleep 1s
#.sh get "http://news.liga.net"
#sleep 2s
#./wd.sh executeJS "jQCheck"
#sleep 2s
#./wd.sh click "#menu_item_finance>a"
#sleep 3s/wd.sh start
#sleep 1s
#./wd.
