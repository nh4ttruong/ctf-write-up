#!/bin/bash

i="0"
res=""
while [ $i -lt 70 ]
do
path="readme_${i}.txt"
temp=$( cat $path )
res="$res$temp"
i=$[i + 1]
done
echo $res