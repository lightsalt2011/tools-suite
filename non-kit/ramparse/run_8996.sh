android=/home/lvfeng/disk_ext/trunk/8996/android
tools=/home/lvfeng/disk_ext/trunk/8996/android/vendor/qcom/opensource/tools/linux-ramdump-parser-v2
parsetz=/home/lvfeng/disk_ext/trunk/8996/oem/trustzone_images/core/securemsm/tools/scripts

mkdir dump_logs

echo "start 8996 parser"

python "$tools"/ramparse.py --vmlinux ./vmlinux --nm-path "$android"/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm \
    --gdb-path "$android"/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-gdb \
 -a . --outdir ./dump_logs  -x --64-bit --force-hardware 8996

echo "end 8996 parser"

echo "*************8996 ram parser TZ start"
python "$parsetz"/tz_diag_parser.py PIMEM.BIN OCIMEM.BIN DDRCS0.BIN DDRCS1.BIN  > ./dump_logs/tz_log.txt
echo "*************8996 ram parser TZ done"


