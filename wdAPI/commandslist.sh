#!/usr/bin/env bash
while read line
do
echo -n "$line" | tr '|' '\ ' | awk  '{print $1}' | tr -d '\n'
echo -n " "
done < bindings
echo ""