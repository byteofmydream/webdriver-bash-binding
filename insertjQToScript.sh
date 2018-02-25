#!/usr/bin/env bash
placeholder="PLACEHOLDER--"
jqScript=$(cat `pwd`"/js/jQCheck.js")
jsScript=`cat`
lineNumBefore=`echo "$jqScript" | grep -n ${placeholder} | tr ":" "\n" | grep -v ${placeholder}`
totalLinesNumber=`echo "$jqScript" | wc -l`
let "lineNumAfter=totalLinesNumber-lineNumBefore"
((lineNumBefore--))

jqScriptA=`echo "$jqScript" | head -${lineNumBefore}`
jqScriptB=`echo "$jqScript" | tail -${lineNumAfter}`

echo "$jqScriptA$jsScript$jqScriptB"