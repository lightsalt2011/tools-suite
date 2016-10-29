#!/bin/bash

while true;
do 
	adb shell input text 123456
	#adb shell input keyevent 66
	adb shell input tap 950 1000
    sleep 5
done
#end 

