#parsetools=/home/lvfeng/trunk/oem/rpm_proc/core/bsp/rpm/scripts/hansei/
#parsetools=~/disk_ext/trunk/8992/oem_M/rpm_proc/core/bsp/rpm/scripts/hansei/
parsetools=/home/lvfeng/disk_ext/trunk/8939/oem-L/U1/rpm_proc/core/bsp/rpm/scripts/hansei

mkdir ./RPM_logs

python "$parsetools"/hansei.py --elf ./RPM_AAAAANAAR_rpm.elf -o ./RPM_logs/ ./CODERAM.BIN ./DATARAM.BIN ./MSGRAM.BIN
