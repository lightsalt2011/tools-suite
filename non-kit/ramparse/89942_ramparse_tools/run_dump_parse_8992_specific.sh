android=/home/lvfeng/trunk/8994/android_rom
binutil=/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
parsetools=~/tools/8994_ramparse_tools/ramparse_tools_codeaurora/tools/linux-ramdump-parser-v2
parsetz=/home/lvfeng/disk_ext/trunk/8992/oem/common/trustzone_images/core/securemsm/tools/scripts/msm8992/
mkdir AP_logs

echo "*************8992 ram parser TZ start"
python "$parsetz"/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./AP_logs/tz_log.txt
echo "*************8992 ram parser TZ done"

sleep 2


echo "*************8992 ram parser AP start"
python "$parsetools"/ramparse.py --vmlinux ./vmlinux --nm-path "$android"/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm \
--gdb-path "$android"/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-gdb \
--ram-file ./DDRCS0_0.BIN 0x00000000 0x1FFFFFFF --ram-file ./DDRCS0_1.BIN 0x40000000 0x5FFFFFFF --ram-file ./DDRCS1_0.BIN 0x20000000 0x3FFFFFFF --ram-file ./DDRCS1_1.BIN 0x60000000 0x7FFFFFFF \
--ram-file ./OCIMEM.BIN 0xFE800000 0xFE80FFFF --phys-offset 0x00000000 --64-bit --force-hardware 8992 --dmesg --check-for-watchdog --cpu-state --dump-page-tables  --print-pagetracking \
--print-pagetypeinfo  --check-rodata  --print-runqueues  --print-vmalloc --print-vmstats --print-irqs --print-workqueues --print-kconfig --print-tasks --t32launcher --parse-debug-image \
--qtf --print-rtb --ddr-compare --clock-dump --cpr-info --thermal-info --timer-list --outdir ./AP_logs

echo "*************8992 ram parser AP done"
