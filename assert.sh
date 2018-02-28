#!/usr/bin/env bash

actualValue=${1}
command=${2}
expectedValue=${3}
extraArgument=${4}

if [ "$command" == "equals" ]
then
    if [ "$actualValue" == "$expectedValue" ]
    then
    echo "Assertion passed. $actualValue was equal to $expectedValue"
    exit 0
    else
    echo "Assertion failed. Expected $actualValue is not equal to $expectedValue"
    exit 1
    fi
fi

if [ "$command" == "inRange" ]
then
    if [ "$actualValue" -ge "$expectedValue" -a "$actualValue" -le "$extraArgument" ]
    then
    echo "Assertion passed. $actualValue was between $expectedValue and $extraArgument"
    exit 0
    else
    echo "Assertion failed. $actualValue was not in range of $expectedValue and $extraArgument"
    exit 1
    fi
fi

echo "missing or wrong command provided"
exit 1
