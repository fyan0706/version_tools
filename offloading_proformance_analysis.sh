#! /usr/bin/bash

for file in `ls dsctest*`
do
	cat $file| head -n 174 | tail -n +130|awk -F: '{print $4}'|awk -F: '{print $1}'|awk '{print $1}' > $file.tmp 
	# get the useful date from each log file.
done

paste *.tmp > result.log 	# merge all the date into 1 file
sed 's/ /\t/g' result.log	# change space to tab in order that the data can be used in excel
rm -rf *.tmp
