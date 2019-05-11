#!/bin/bash
ls $1 | \
while read CMD; 
do
	
	echo "file '$1/"$CMD"'"
	echo "file '$1/silencio.wav'"
done\
> lista-samples.txt
