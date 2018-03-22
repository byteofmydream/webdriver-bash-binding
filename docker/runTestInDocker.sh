#!/usr/bin/env bash
testname=${1}
cd docker
docker build -t chromewd . > /dev/null
cd ..
containerId=`docker run -d -P chromewd`
commandInsideDocker=`echo -n "cd /home/seluser/webdriver-bash-binding/tests; ./"${testname}".sh"`
echo ${commandInsideDocker}
docker exec -it ${containerId} bash -c "$commandInsideDocker"
docker rm ${containerId} --force
