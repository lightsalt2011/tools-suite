tools=/home/lvfeng/disk_ext/trunk/8992/android_rom/vendor/qcom/opensource/tools/linux-ramdump-parser-v2
echo "start"
mkdir out
python "$tools"/ramparse.py --vmlinux ./vmlinux --gdb-path /usr/bin/gdb --nm-path /usr/bin/nm -x \
 -a . --outdir ./out
