#!/bin/bash

echo "Alarm duration is $1h $2m"
echo "snoozes is $3 snoozes"
echo "snooze time $4m"
echo "happy dreams" 


var=$3 
sleep  $1h $2m
cvlc --repeat /home/okasha/Desktop/MyScripts/Wecker-sound.mp3
while [ $var != 0 ]
do
	echo "Snooze `expr $3 - $var + 1`"
	sleep $4m
	cvlc --repeat /home/okasha/Desktop/MyScripts/Wecker-sound.mp3
	var=`expr $var - 1`
done
