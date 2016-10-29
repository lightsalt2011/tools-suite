#!/system/bin/sh
#thermal_path=/sys/devices/virtual/thermal/
rm -f  /data/thermal_cpuinfo.txt

#echo 8 > /proc/sys/kernel/printk
echo 'file msm_thermal.c +p' > /sys/kernel/debug/dynamic_debug/control
#echo Y>/d/msm_thermal/log_tsens_temperature

sleep 1 && while [ 1 ];

do

echo DayTime: `date +%m_%d-%k.%M.%S`;
echo "ThermalZoneX---->Temp list:"

#temp
cd /sys/devices/virtual/thermal/
echo "xo_therm_buf: `cat thermal_zone28/temp;` "
echo "cpu0: `cat thermal_zone5/temp;` "
echo "cpu1: `cat thermal_zone7/temp;`"
echo "cpu2: `cat thermal_zone10/temp;`"

echo "cpu3: `cat thermal_zone12/temp;`"
echo "gpu: `cat thermal_zone16/temp;`"

echo "pmem: `cat thermal_zone2/temp;`"
echo "batt: `cat /sys/class/power_supply/battery/temp`"
echo "  --------temp end----------"

#Freq
cd  /sys/devices/system/cpu/
echo "cpu0: `cat cpu0/cpufreq/cpuinfo_cur_freq`  "
echo "cpu1: `cat cpu1/cpufreq/cpuinfo_cur_freq`  "
echo "cpu2: `cat cpu2/cpufreq/cpuinfo_cur_freq`  "
echo "cpu3: `cat cpu3/cpufreq/cpuinfo_cur_freq`  "
echo "gpu: `cat /sys/class/kgsl/kgsl-3d0/gpuclk`  "
echo "  --------cpufreq end----------"

#Current
echo "online: `cat /sys/devices/system/cpu/online`"
echo "current_now: `cat /sys/class/power_supply/battery/current_now`"
echo "system_temp_level: `cat /sys/class/power_supply/battery/system_temp_level`"
echo "brightness: `cat /sys/class/leds/lcd-backlight/brightness`"
echo "   "


#DDR freq
echo "ddr freq: `cat /d/clk/bimc_clk/measure`"
echo "   "

sleep 1;
done
#done  > /data/thermal_cpuinfo.txt

#
#system/cpu/cpu0/cpufreq/scaling_available_frequencies
#echo userspace   > cpu0/cpufreq/scaling_governor
#echo 691200 > cpu0/cpufreq/scaling_max_freq	
#echo 691200 > cpu0/cpufreq/scaling_min_freq

#echo userspace   > cpu3/cpufreq/scaling_governor
#echo 691200 > cpu3/cpufreq/scaling_max_freq	
#echo 691200 > cpu3/cpufreq/scaling_min_freq
