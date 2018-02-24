#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then
      gsed ${1} ${2}
else
    sed ${1} ${2}
fi
