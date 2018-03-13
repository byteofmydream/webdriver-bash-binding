#!/usr/bin/env bash

while IFS="=" read -r propName propValue || [ -n "$propName" ];
do
    if [[ -n "${propName}" ]]
    then
        if [[ ${propName} != "#"* ]]
        then
            eval FOO='$'${propName}
            if [ -z ${FOO} ]
            then
                export "$propName=$propValue"
            else
                echo "Env. variable ${propName} is busy, choose another name"
        #        exit 1
            fi
        fi
    fi
done < config.properties
exit 0