#!/usr/bin/env sh

read line

while read  line; do


	a=0
	b=0
	c=0
	d=""
	if [[ ${line:1:1} == "r" ]]; then 
		a=$((a+4)) 
	fi
	
	if [[ ${line:2:1} == "w" ]]; then 
		a=$((a+2))
	fi
	
	if [[ ${line:3:1} == "x" ]]; then 
		a=$((a+1))	
	fi
	
	if [[ ${line:4:1} == "r" ]]; then 
		b=$((b+4)) 
	fi
	
	if [[ ${line:5:1} == "w" ]]; then 
		b=$((b+2)) 
	fi
	
	if [[ ${line:6:1} == "x" ]]; then 
		b=$((b+1)) 
	fi
	
	
	if [[ ${line:7:1} == "r" ]]; then 
		c=$((c+4))
	fi
	
	if [[ ${line:8:1} == "w" ]]; then 
		c=$((c+2))	
	fi
	
	if [[ ${line:9:1} == "x" ]]; then 
		c=$((c+1))	
	fi
	
	if [[ ${line:0:1} != "l" ]]; then
	
		if [[ ${line:3:1} == "x" ]]; then 
			d="*" 
		fi
		
		if [[ ${line:0:1} == "d" ]]; then 
			d="/"
		fi 
	
	fi
	
	
	spaces=0
	
	size=${#line}
	size=$((size-1))
	for (( i=$size; $i>=0 ; i--)); do
		
		if [[ ${line:i:1} == ' ' ]]; then 
			break;
		fi
	done;
	
	
	
	i=$((i+1))

	echo "${line:i:i}$d $a$b$c"; 


	
done

