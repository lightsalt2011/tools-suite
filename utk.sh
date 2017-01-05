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

simg2img-help()
{
	echo "11\
		file system.img
        system.img: Linux rev 1.0 ext4 filesystem data, UUID=57f8f4bc-abf4-655f-bf67-946fc0f9f25b (needs journal recovery) (extents) (large files)
		mount -t ext4 -o loop system.img  systemimg

		./make_ext4fs -l 1024M -s -a system system_new.img systemimg

		file system_new.img
		system_new.img: data
		./simg2img system_new.img system_out.img
		file system_out.img
		system_out.img: Linux rev 1.0 ext4 filesystem data


		[run]:	simg2img /disk10/lvfeng.lf/trunk/robot/xmake/../prebuilts/images/tablet_cht/system.img /tmp/tmpiVCHcF/system.img.ext4
		[run]:	mksquashfs /tmp/tmpiVCHcF/system.img.ext4 /tmp/tmpiVCHcF/system.sqsh
		unsquashfs system.sqsh system.img.ext4
		"
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
	rssh)
		ssh lvfeng.lf@10.101.169.18
		exit
		;;
	simg2img)
		simg2img-help
		exit
		;;
	*) adb shell $*;;
esac
