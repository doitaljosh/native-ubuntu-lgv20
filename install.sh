#!/bin/sh

DATADEV='/dev/block/sda20'
SDDEV='/dev/block/mmcblk0p1'
BOOTPART='/dev/block/bootdevice/by-name/boot'
DNLDPART='/dev/block/bootdevice/by-name/laf'
ROOTFS='ubuntu-1804-rootfs-elsa.tar.gz'

cp busybox-armv7l /sbin/
chmod +x /sbin/busybox-armv7l

echo "Checking files..."
if [ ! -f "$ROOTFS" ]; then
	echo "Rootfs archive is missing. Exiting."
	exit
	exit
fi

usage() {
	echo "Usage: ./install.sh [sdcard | data]"
	echo "              sdcard:              "
	echo "Install rootfs to sdcard and boot  "
	echo "image to laf partition. (Dual-boot "
	echo "Ubuntu and Android.) Boot into     "
	echo "Ubuntu by entering download mode.  "
	echo "               data:               "
	echo "Install rootfs to data partition   "
	echo "and boot image to boot partition.  "
	echo "(Replaces Android with Ubuntu.)    "
	echo "Boot into Ubuntu by powering on    "
	echo "normally."
}

sdcard() {
	echo "Formatting SD card"
	umount /external_sd
	make_ext4fs $SDDEV
	mount /external_sd
	echo "Extracting rootfs"
	/sbin/busybox-armv7l tar -C /external_sd/ -xzpf $ROOTFS
	echo "Backing up laf image to /cache"
	dd if=$DNLDPART of=/cache/lafbak.img
	echo "Flashing boot image"
	dd if=/dev/zero of=$DNLDPART
	dd if=boot-sdcard.img of=$DNLDPART
	echo "Done! Reboot into Ubuntu by entering download mode."
}

internal() {
	echo "Formatting data"
        umount /data
        make_ext4fs $DATADEV
        mount /data
        echo "Extracting rootfs"
        /sbin/busybox-armv7l tar -C /data/ -xzpf $ROOTFS
	echo "Backing up boot image to /cache"
	dd if=$DATADEV of=/cache/bootbak.img
        echo "Flashing boot image"
        dd if=/dev/zero of=$DNLDPART
        dd if=boot-data.img of=$DNLDPART
        echo "Done! Reboot into Ubuntu by powering on normally."
}


case "$1" in
	-h|--help|help)
	usage
	exit
	;;
	sdcard)
	sdcard
	;;
	internal)
	internal
	;;
	*)
	usage
	exit
	;;
esac


