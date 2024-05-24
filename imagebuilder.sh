#!/bin/bash

make image PROFILE="xunlong_orangepi-r1-plus-lts" \
PACKAGES="acpid attr base-files bash bc blkid block-mount blockd bsdtar btrfs-progs busybox bzip2 \
        cgi-io chattr comgt comgt-ncm containerd coremark coreutils coreutils-base64 coreutils-nohup \
        coreutils-truncate curl docker docker-compose dockerd dosfstools dumpe2fs e2freefrag e2fsprogs \
        exfat-mkfs f2fs-tools f2fsck fdisk gawk getopt git gzip hostapd-common iconv iw iwinfo jq \
        jshn libjson-script liblucihttp \
        liblucihttp-lua losetup lsattr lsblk lscpu mkf2fs mount-utils openssl-util parted \
        perl-http-date perlbase-file perlbase-getopt perlbase-time perlbase-unicode perlbase-utf8 \
        pigz ppp ppp-mod-pppoe proto-bonding pv rename resize2fs runc tar tini ttyd tune2fs \
        uclient-fetch uhttpd uhttpd-mod-ubus unzip uqmi usb-modeswitch uuidgen wget-ssl whereis \
        which wpad-basic wwan xfs-fsck xfs-mkfs xz xz-utils ziptool zoneinfo-asia zoneinfo-core zstd \
        luci luci-base luci-compat luci-lib-base luci-lib-docker \
        luci-lib-ip luci-lib-ipkg luci-lib-jsonc luci-lib-nixio luci-mod-admin-full luci-mod-network \
        luci-mod-status luci-mod-system" \
FILES="files"
