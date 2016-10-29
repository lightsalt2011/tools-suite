parsetools=/home/lvfeng/disk_ext/trunk/8996/oem/rpm_proc/core/bsp/rpm/scripts/hansei/
mkdir ./RPM_logs

python "$parsetools"/hansei.py --elf ./RPM_AAAAANAAR.elf -o ./RPM_logs/ ./CODERAM.BIN ./DATARAM.BIN ./MSGRAM.BIN
