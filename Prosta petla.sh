#!/usr/bin/env sh


read n;
x=1

while [ $[x+1] ] ; do
	if [ $x = $n ] 
	then
		printf "$x\n";
		break;
	else
		printf "$x ";
	fi
	x=$[x + 1]
done
