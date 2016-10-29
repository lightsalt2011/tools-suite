#! /bin/bash
#####################################################
#####       bash ./logcat.sh -s devicesId       #####
#####################################################
export ADB="./Log/adb/adb"
Today=`date +%Y-%m-%d_%H:%M:%S`
help()
{
    echo "-s  -- Specify the device number of main phone"
    echo "-h  -- Help"
    exit 1
}

deviceNo=""
while getopts s:h OPTION
    do
        case $OPTION in
            s) echo "parameter -s"
            deviceNo=$OPTARG
            echo "Device num is ${deviceNo}";   
            ;;
            h) echo "parameter -h"
            help;
            echo "--------help---------";
            ;;
            \?)  echo "?"
            echo "Need parameter value"
            exit 1
            ;;
        esac
done
 
while true
    do
        if [ -z "$deviceNo" ]; then
            sleep 1
            $ADB logcat -v time >> ./Log/Logcat_${Today}.log
        else
            sleep 1
            $ADB -s $deviceNo logcat -v time >> ./Log/Logcat_${deviceNo}_${Today}.log           
        fi
done
