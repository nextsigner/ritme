#!/bin/bash
ls $1 | \
while read CMD; 
do
	
	echo $(echo $CMD | cut -d"." -f1)
done\
> samples.txt
