#!/bin/sh
adb root; adb remount;
sleep 1;

echo "adb push build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.* Starting"
adb shell mount -o remount,rw /dev/block/bootdevice/by-name/modem /firmware

adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.mdt /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b00 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b01 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b02 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b03 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b04 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b05 /firmware/image
adb push ./build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.b06 /firmware/image

echo "adb push build/ms/bin/PIL_IMAGES/SPLITBINS_IADAANAA/$@.* OK"

