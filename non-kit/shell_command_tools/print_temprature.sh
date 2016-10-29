while true;
do
    for device_name in `ls /sys/class/thermal/`
    do
        type=`cat /sys/class/thermal/${device_name}"/type"`;
        temp=`cat /sys/class/thermal/${device_name}"/temp"`;
        echo ${type}": "${temp}
    done
    echo "**********************************"
    sleep 2;
done;
