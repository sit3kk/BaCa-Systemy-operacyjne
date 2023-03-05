#!/usr/bin/env sh

read command;

if [[ ${#command} == 2 ]] ; then

	letter=${command:0:1};
	
	while read -r line; do
		counter=0;
		for (( i=0; $i <= ${#line} ; i++ )); do
			letter2=${line:i:1}
			if [[ $letter == $letter2 ]]; then 
				counter=$((counter+1))
				fi
			done;
			
		echo $counter
		done
			
		
	
else

	letter=${command:0:1};
	
	while read -r line; do
		counter=0;
		for (( i=0; $i <= ${#line} ; i++ )); do
			letter2=${line:i:1}
			letter2=${letter2,,}
			if [[ $letter == $letter2 ]]; then 
				counter=$((counter+1))
				fi
			done;
			
		echo $counter
		done
		
fi 






