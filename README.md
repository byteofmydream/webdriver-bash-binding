webdriver-bash-binding

Very basic tool, which provides ability to run selenium tests with quite simple syntax, built totally on BASH

Example:

```
#!/usr/bin/env bash
#this is example of simple UI test
#chromedriver must be present in this folder

source initProperties.sh
pkill -9 Chrome && pkill -9 chrome
./chromedriver --port="${HUB_PORT}" --url-base="${RELATIVE_URL}" &
./wd.sh start
sleep 3s
./setImplicitWait.sh 10000
./wd.sh get "https://sinoptik.ua/"
sleep 1s
./wd.sh type "#search_city" "Драгобрат"
./wd.sh click ".search_city-submit"
./wd.sh click ".day-link:contains('Воскресенье')"
actualText=`./wd.sh getText "div.main.loaded>p.day-link"`
./assert.sh "${actualText}" equals Воскресенье

for i in {0..3}
do
    actualPressure=`./wd.sh getText ".weatherDetails>tbody>.temperatureSens+tr>td:visible:eq($i)"`
    ./assert.sh "$actualPressure" inRange 600 700
done
./wd.sh close
```
