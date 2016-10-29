#!/bin/bash 

if [ $# -lt 1 ]; then
	echo "common utils"
	echo "utk.sh \" cmd \" "
	exit 1;
fi

function die() {
	echo -e "\a \033[31m Error: [$@] \033[0m"
	exit -1
}

warning()
{
	if [ $1 != 0 ]; then
		die "mount.cifs"
	fi
}

utk_mount-net()
{
	sudo mount.cifs //172.16.2.16/share/ ~/mnt/share/ -o file_mode=0555,dir_mode=0555,ro,username=lvfeng,password=passion2011\!,iocharset=utf8
	warning $?

	sudo mount.cifs //172.16.2.225/flash/ ~/mnt/flash/ -o file_mode=0555,dir_mode=0555,ro,username=lvfeng,password=passion2011\!,iocharset=utf8
	warning $?
}

case "$1" in 
	mount-net)
		utk_mount-net
		exit 
		;;
	umount-net)
		umount ~/mnt/flash/ # TODO
		exit
		;;
	*) adb shell $*;;
esac
