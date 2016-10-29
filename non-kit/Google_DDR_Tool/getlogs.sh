#!/bin/bash
#####################################################
#####     bash ./processinfo.sh -s devicesId    #####
#####################################################
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
            s) echo " "
            deviceNo=$OPTARG
            echo "Device number is: ${deviceNo}";   
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
            date +%Y-%m-%d_%H:%M:%S
            a=`date +%Y-%m-%d_%H:%M:%S`
            echo "Catching logs ..."
            mkdir -p ./Log/PhoneLogs/$a/dropbox
            mkdir -p ./Log/PhoneLogs/${a}/anr
            #3. logcat 文件
            adb pull /data/logs ./Log/PhoneLogs/${a}/
            #4. 手机anr后产生的traces文件
            adb pull /data/anr ./Log/PhoneLogs/${a}/anr/
            #5. 手机crash后产生的， 如：system_app_crash@1391826826948.txt 文件里面会显示crash的程序
            adb pull /data/system/dropbox ./Log/PhoneLogs/${a}/dropbox/
            #6. dmesg是kernel的log，凡是跟kernel相关的，比如driver出了问题（相机，蓝牙，usb，启动，等等）开机信息亦保存在/var/log目录中，名称为dmesg的文件里
            echo `date +%Y-%m-%d_%H:%M:%S` >> ./Log/PhoneLogs/${a}/dmesg.log
            adb shell dmesg >> ./Log/PhoneLogs/${a}/dmesg.log                     
            #7. 重启前的kernel相关log
            adb pull /proc/last_kmsg ./Log/PhoneLogs/${a}/
            #8. 当手机系统出现死机后，系统会在/data/dontpanic中打印相关的信息。
            adb pull /data/dontpanic ./Log/PhoneLogs/${a}/
            #9. tombstones 用来记录native进程崩溃的 core dump 日志 
            adb pull /data/tombstones ./Log/PhoneLogs/${a}/

        else
            sleep 1
            date +%Y-%m-%d_%H:%M:%S
            a=`date +%Y-%m-%d_%H:%M:%S`
            echo "Catching logs ..."
            mkdir -p ./Log/PhoneLogs/$a/dropbox
            mkdir -p ./Log/PhoneLogs/${a}/anr
            #3. logcat 文件
            adb -s ${deviceNo} pull /data/logs ./Log/PhoneLogs/${a}/
            #4. 手机anr后产生的traces文件
            adb -s ${deviceNo} pull /data/anr ./Log/PhoneLogs/${a}/anr/
            #5. 手机crash后产生的， 如：system_app_crash@1391826826948.txt 文件里面会显示crash的程序
            adb -s ${deviceNo} pull /data/system/dropbox ./Log/PhoneLogs/${a}/dropbox/
            #6. dmesg是kernel的log，凡是跟kernel相关的，比如driver出了问题（相机，蓝牙，usb，启动，等等）开机信息亦保存在/var/log目录中，名称为dmesg的文件里
            echo `date +%Y-%m-%d_%H:%M:%S` >> ./Log/PhoneLogs/${a}/dmesg.log
            adb -s ${deviceNo} shell dmesg >> ./Log/PhoneLogs/${a}/dmesg.log                     
            #7. 重启前的kernel相关log
            adb -s ${deviceNo} pull /proc/last_kmsg ./Log/PhoneLogs/${a}/
            #8. 当手机系统出现死机后，系统会在/data/dontpanic中打印相关的信息。
            adb -s ${deviceNo} pull /data/dontpanic ./Log/PhoneLogs/${a}/
            #9. tombstones 用来记录native进程崩溃的 core dump 日志 
            adb -s ${deviceNo} pull /data/tombstones ./Log/PhoneLogs/${a}/
        fi
        sleep 1800
done

