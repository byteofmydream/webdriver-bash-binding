#!/usr/bin/env bash
while IFS="=" read -r propName propValue || [ -n "$propName" ];
do
    eval FOO='$'${propName}
    if [ -z ${FOO} ]
    then
        export "$propName=$propValue"
    else
        echo "${propName} is busy, please, choose another name"
    fi
done < config.properties