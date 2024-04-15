#!/bin/bash

opkg update
opkg install parted cfdisk f2fs-tools losetup
echo -e "ok\nfix" | parted -l ---pretend-input-tty
parted -s /dev/mmcblk0 resizepart 2 100%
LOOP="$(losetup -n -O NAME | sort | sed -n -e "1p")"
ROOT="$(losetup -n -O BACK-FILE ${LOOP} | sed -e "s|^|/dev|")"
OFFS="$(losetup -n -O OFFSET ${LOOP})"
LOOP="$(losetup -f)"
losetup -o ${OFFS} ${LOOP} ${ROOT}
fsck.f2fs -f ${LOOP}
mount ${LOOP} /mnt
umount ${LOOP}
resize.f2fs ${LOOP}
reboot
