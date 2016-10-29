#!/bin/sh
adb root; adb remount;
sleep 1;

echo "adb push build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.* Starting"
adb shell mount -o remount,rw /dev/block/bootdevice/by-name/modem /firmware

PATH=/system/etc/firmware/

ADB=/home/lvfeng/system-config/bin/Linux/adb
if [ $1 = 1 ]; then 
	PATH=/system/etc/firmware/
elif [ $1 = 0 ]; then
	PATH=/firmware/image
else
	echo "usage: sh push_secureimage.sh 1/0"
fi

for file in ./*
do
    if test -f $file
    then
        echo "$file to $PATH"
		$ADB push $file $PATH
    fi

    if test -d $file
    then
        echo $file is dir
    fi
done


echo "adb push build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.* OK"



