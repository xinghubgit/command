#!/usr/bin/env bash

cat sam-region.log | grep page | awk '{print $17}' |  sed 's/size=\([0-9].*\),$/\1/g'  | sort -n |  awk '{sum += $1}END{print "sum = ", sum}'

tail -2000 sam-region.log| awk '{print $1, $17}' | sed 's/\.[0-9][0-9][0-9] size=/ /g' | sed 's/,//g' > second
cat second| awk '{s[$1] += $2}END{for (i in s) {print i, s[i]} }' | sort | awk '{sum += $2}END{print "Average=", sum/NR}'