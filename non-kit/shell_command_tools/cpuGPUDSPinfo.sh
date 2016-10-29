while [ 1 ]
do
sleep 1
echo "**************************************************************************"
echo "cpu 0 freq is " `adb shell cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`
echo "cpu 4 freq is " `adb shell cat /sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq`
echo "cpu 5 freq is " `adb shell cat /sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq`
echo "cpu 0 temp is " `adb shell cat /sys/class/thermal/thermal_zone7/temp`
echo "cpu 4 temp is " `adb shell cat /sys/class/thermal/thermal_zone12/temp`
echo "cpu 5 temp is " `adb shell cat /sys/class/thermal/thermal_zone13/temp`
echo "-----------------------------------------------------------"
echo "GPU freq is " `adb shell cat /sys/class/kgsl/kgsl-3d0/gpuclk`
echo "GPUbusy is "  `adb shell cat /sys/class/kgsl/kgsl-3d0/gpubusy`
echo "GPU up  temp is " `adb shell cat /sys/class/thermal/thermal_zone11/temp`
echo "GPU down temp is " `adb shell cat /sys/class/thermal/thermal_zone10/temp`
echo "-----------------------------------------------------------"
echo "QDSP1  temp is " `adb shell cat /sys/class/thermal/thermal_zone2/temp`
echo "QDSP2  temp is " `adb shell cat /sys/class/thermal/thermal_zone3/temp`
echo "-----------------------------------------------------------"
echo "modem  temp is " `adb shell cat /sys/class/thermal/thermal_zone6/temp`
echo "-----------------------------------------------------------"
echo "MDSS  temp is " `adb shell cat /sys/class/thermal/thermal_zone5/temp`

done
