#!/usr/bin/env bash
while IFS="=" read -r propName propValue || [ -n "$propName" ];
do
    eval FOO='$'${propName}
    if [ -z ${FOO} ]
    then
        export "$propName=$propValue"
    else
        echo "Env. variable ${propName} is busy, choose another name"
    fi
done < config.properties