#!/usr/bin/env bash
#this is example of simple UI test

#pkill -9 Chrome && pkill -9 chrome
#./chromedriver --port=4444 --url-base="wd/hub" &
./wd.sh start
sleep 3s
./setImplicitWait.sh 10000
./wd.sh get "https://sinoptik.ua/"
sleep 1s
./wd.sh type "#search_city" "Драгобрат"
./wd.sh click ".search_city-submit"
./wd.sh click ".day-link:contains('Воскресенье')"
actualText=`./wd.sh getText ".infoDayweek"`
./assert.sh "$actualText" equals Воскресенье

for i in {0..3}
do
    actualPressure=`./wd.sh getText ".weatherDetails>tbody>.temperatureSens+tr>td:visible:eq($i)"`
    ./assert.sh "$actualPressure" inRange 600 700
done
./wd.sh close
