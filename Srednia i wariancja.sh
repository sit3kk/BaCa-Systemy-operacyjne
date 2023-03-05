#!/usr/bin/env sh


sum=0;
i=0;

while read n; do
	if [ -n "$n" ]; then
		arr="$arr $n"
		sum=$((sum+n))
		i=$((i+1))
	fi
done


avg=$((sum/i))
war=0

for x in $arr; do
	war=$(( ($x-$avg)*($x-$avg) +  war))
done


echo $avg
echo $((war/i))

