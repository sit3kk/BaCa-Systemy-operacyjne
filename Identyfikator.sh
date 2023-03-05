#!/usr/bin/env bash



size=0;

while read word; do
	array="$array $word"
	size=$((size+1))
	if [[ $size == 12 ]];
	 then break; fi
	 
	
	
done

min=1000000

for x in $array; do
	counter=0;
	for y in $array; do
		if [[ $x == $y ]]; then 
			counter=$((counter+1));
		fi
	done;
	
	if (( $counter<$min )); then
		min=$counter;
		minWord=$x;
		fi
		
done


echo "$minWord $min"
	
