#!/bin/sh

RAM_DUMP_ROOT=/data/ram_dump

MOUNT_POINT_PATH=${RAM_DUMP_ROOT}/udisk
UDISK_PARTITION_BLOCK=/dev/block/bootdevice/by-name/udisk

RAM_DUMP_STOR_PATH=${RAM_DUMP_ROOT}/export
RAM_DUMP_FILE=${RAM_DUMP_STOR_PATH}/udisk_ram_dump.tar.gz

UDISK_COOKIE_FILE=${MOUNT_POINT_PATH}/rdcookie.txt
UDISK_RAM_DUMP_DIR=${MOUNT_POINT_PATH}/1
UDISK_RAM_DUMP_ERROR_IND=${UDISK_RAM_DUMP_DIR}/errfile.txt
UDISK_RAM_DUMP_ERROR_IND1=${UDISK_RAM_DUMP_DIR}/errmax.txt

BUSYBOX_PATH=/system/xbin/busybox

check_something()
{
	if [ ! -x ${BUSYBOX_PATH} ]; then
		echo "busybox tool is not in the system. exit";
		exit 1;
	fi
}

umount_udisk_fat32_fs()
{
	sync;

	umount ${MOUNT_POINT_PATH};

	if [ $? == 0 ]; then
		echo "umount succussfully";
	    return 0;
	else
		echo "Failed to umount";
	return 1;
	fi
}

mount_udisk_fat32_fs()
{
	echo "mount udisk fat32 file system";
	echo "udisk partition path = ${UDISK_PARTITION_BLOCK}";
	echo "mount point = ${MOUNT_POINT_PATH}";

	if [ ! -d ${MOUNT_POINT_PATH} ]; then
		echo "${MOUNT_POINT_PATH} doesn't exist, created."
		mkdir -p ${MOUNT_POINT_PATH};
	fi


	mount -t vfat ${UDISK_PARTITION_BLOCK} ${MOUNT_POINT_PATH};

	if [ $? == 0 ]; then
		echo "mount successfully";
	else
		echo "Failed to mount";
		return 1;
	fi

	if [ ! -f ${UDISK_COOKIE_FILE} ]; then
		echo "What is problem? cookie is not in!!!";
		umount_udisk_fat32_fs
		return 1;
	fi

	if [ ! -d  ${UDISK_RAM_DUMP_DIR} ]; then
		echo "What is problem? ${UDISK_RAM_DUMP_DIR} is not in udisk partition";
		umount_udisk_fat32_fs
		return 1;
	fi

#	if [ -f ${UDISK_RAM_DUMP_ERROR_IND} ]; then
#		echo "${UDISK_RAM_DUMP_ERROR_IND} is exist, it is a error when ram dump";
#		echo "Please check !!!";
#		umount_udisk_fat32_fs
#		return 1;
#	fi

#	if [ -f ${UDISK_RAM_DUMP_ERROR_IND1} ]; then
#		echo "${UDISK_RAM_DUMP_ERROR_IND1} is exist, it is a error when ram dump";
#		echo "Please check !!!";
#		umount_udisk_fat32_fs
#		return 1;
#	fi

	return 0;
}

ram_dump_file_pack()
{
	echo "tar .........................."
	#echo ${RAM_DUMP_STOR_PATH};
	#echo ${RAM_DUMP_FILE}

	if [ ! -d ${RAM_DUMP_STOR_PATH} ]; then
		echo "${RAM_DUMP_STOR_PATH} doesn't exist, created."
		mkdir ${RAM_DUMP_STOR_PATH};
	fi

	if [ -f ${RAM_DUMP_FILE} ]; then
		echo "${RAM_DUMP_FILE} exist, delete it"
		rm ${RAM_DUMP_FILE};
	fi

	busybox tar -zcvf ${RAM_DUMP_FILE} ${UDISK_RAM_DUMP_DIR}

	if [ $? == 0 ]; then
		echo "tar succussfully";
		return 0;
	else
		echo "Failed to tar";
		return 1;
	fi
}

delete_ram_dump_dir()
{
	rm -rf ${UDISK_RAM_DUMP_DIR};

	if [ $? == 0 ]; then
		echo "delete succussfully";
		return 0;
	else
		echo "Failed to delete";
		return 1;
	fi
}

exit_from_exception()
{
	echo "Exception exit, Sorry!!!";
	exit 1;
}

######################################################
# begain to work
######################################################

echo "The script will mount the udisk partition and tar the ram dump file";
echo "are you ready to do? (Y/N)";

read READ_USER

if [ "${READ_USER}" = "Y" ]; then
	echo "Good choice";
elif [ "${READ_USER}" = "N" ]; then
	echo "You choice is always right, exit";
	exit 1;
else
	echo "Input Error: ${READ_USER}, exit";
	exit 1;
fi

check_something

mount_udisk_fat32_fs
if [ $? != 0 ]; then
	exit_from_exception;
fi

ram_dump_file_pack
if [ $? != 0 ]; then
	umount_udisk_fat32_fs;
	exit_from_exception;
fi

delete_ram_dump_dir
if [ $? != 0 ]; then
	umount_udisk_fat32_fs;
	exit_from_exception;
fi

umount_udisk_fat32_fs
if [ $? != 0 ]; then
	exit_from_exception;
fi

echo "-----------------------------"
echo "Successfully done."
echo "Please get ram dump file ${RAM_DUMP_FILE}"
echo "-----------------------------"

