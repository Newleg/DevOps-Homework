#!/bin/bash

echo -e "\nChoose what you want to know:\n
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)"

read -p "Enter your choice [1-6] : " ans
if (( $ans == 1 )); then
	cat apache_logs.txt | awk '{print "IP request "$2, $1}' | sort -n | uniq -c | sort -nr | head -1
	
elif (( $ans == 2 )); then
	#cat apache_logs.txt | awk '{print $11, $15}' | sort | uniq -c | sort -nr
	cat apache_logs.txt | awk '{print $11}' | awk '/"http:/' | sort | uniq -c | sort -rn | head -1

elif (( $ans == 3 )); then
        cat apache_logs.txt | awk '{print "IP requests "$2, $1}' | sort -n | uniq -c | sort -nr

elif (( $ans == 4 )); then
        cat apache_logs.txt | awk '/error404/' | awk '{print $1, $15}' | sort | uniq -c | sort -rn

elif (( $ans == 5 )); then
        cat apache_logs.txt | awk '/"http:/' | awk '{print $4, $11}' | sort | uniq -c | sort -rn

elif (( $ans == 6 )); then
        cat apache_logs.txt | awk '/bot/' | awk '{print $1, $14, $15}' | sort | uniq -c | sort -rn | ack --passthru 'bot'

else
	echo "please choose wisely"
fi
