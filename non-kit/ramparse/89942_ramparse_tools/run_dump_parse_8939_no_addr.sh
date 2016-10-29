android=~/disk_ext/trunk/8939/android/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7/
binutil=/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
parsetools=~/tools/8994_ramparse_tools/ramparse_tools_codeaurora/tools/linux-ramdump-parser-v2

mkdir AP_logs

echo "*************8992 ram parser TZ start"
#python ~/tools/8994_ramparse_tools/linux-ramdump-parser-v2/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./AP_logs/tz_log.txt
echo "*************8992 ram parser TZ done"

sleep 2


echo "*************8992 ram parser AP start"
python "$parsetools"/ramparse.py --vmlinux ./vmlinux --gdb-path "$android"bin/arm-linux-androideabi-gdb \
--nm-path "$android"bin/arm-linux-androideabi-nm \
 -a .  --outdir  ./AP_logs   --force-hardware 8939
#--ram-file ./DDRCS0_0.BIN 0x00000000 0x2FFFFFFF --ram-file ./DDRCS0_1.BIN 0x80000000 0xAFFFFFFF --ram-file ./DDRCS1_0.BIN 0x30000000 0x5FFFFFFF --ram-file ./DDRCS1_1.BIN 0xB0000000 0xDFFFFFFF --ram-file ./OCIMEM.BIN 0xFE800000 0xFE87FFFF --phys-offset 0x00000000 --64-bit --force-hardware 8994 --dmesg --check-for-watchdog --cpu-state --dump-page-tables  --print-pagetracking --print-pagetypeinfo  --check-rodata  --print-runqueues  --print-vmalloc  --print-vmstats --print-irqs --print-workqueues --print-kconfig --print-tasks --t32launcher --parse-debug-image --qtf --print-rtb --ddr-compare --clock-dump --cpr-info --thermal-info --timer-list --outdir ./AP_logs
echo "*************8992 ram parser AP done"
