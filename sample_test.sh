#!/usr/bin/env bash
#this is example of simple UI test

pkill -9 Chrome && pkill -9 chrome
./chromedriver --port="$(./getOpt.sh HUB_PORT)" --url-base="$(./getOpt.sh HUB_PORT)" &
#echo "$(./getOpt.sh BASE_URL):$(./getOpt.sh HUB_PORT)/$(./getOpt.sh RELATIVE_URL)/""kekkekek"
./wd.sh start
sleep 3s
./setImplicitWait.sh 10000
./wd.sh get "https://sinoptik.ua/"
sleep 1s
./wd.sh type "#search_city" "Драгобрат"
./wd.sh click ".search_city-submit"
./wd.sh click ".day-link:contains('Воскресенье')"
#actualText=`./wd.sh getText ".infoDayweek"`
actualText=`./wd.sh getText "div.main.loaded>p.day-link"`
./assert.sh "${actualText}" equals Воскресенье

for i in {0..3}
do
    actualPressure=`./wd.sh getText ".weatherDetails>tbody>.temperatureSens+tr>td:visible:eq($i)"`
    ./assert.sh "$actualPressure" inRange 600 700
done
./wd.sh close
