#!/bin/bash

rm -rf target/linux package/kernel package/boot package/firmware
git clone -b main --depth 1 https://github.com/openwrt/openwrt.git main
cd main
cp -rf --parents target/linux package/kernel package/boot package/firmware include/kernel* config/Config-images.in config/Config-kernel.in include/image*.mk include/trusted-firmware-a.mk scripts/ubinize-image.sh package/utils/bcm27xx-utils package/devel/perf ../
cd ..
rm -rf main
git clone -b master --depth 1 https://github.com/coolsnowwolf/lede lede
rm -rf target/linux/generic/hack-6.1
cp -r lede/target/linux/generic/hack-6.1 target/linux/generic/
rm -rf lede
wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/pending-6.1/613-netfilter_optional_tcp_window_check.patch -P target/linux/generic/pending-6.1/
wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/kernel/linux/modules/video.mk -P package/kernel/linux/modules/
rm -rf target/linux/generic/hack-6.1/{410-block-fit-partition-parser.patch,724-net-phy-aquantia*,720-net-phy-add-aqr-phys.patch}
wget -N https://raw.githubusercontent.com/openwrt/openwrt/main/include/u-boot.mk -P include/

cd feeds/packages
rm -rf kernel libs/xr_usb_serial_common net/xtables-addons
git clone -b master --depth 1 https://github.com/openwrt/packages custom
cd custom
cp -rf --parents kernel libs/xr_usb_serial_common net/xtables-addons libs/libpfring ../
cd ../../../
wget -N https://raw.githubusercontent.com/openwrt/packages/master/net/coova-chilli/patches/011-kernel517.patch -P package/feeds/packages/coova-chilli/patches/

# Kernel_6.6
rm -rf target/linux/generic/hack-6.6
git clone -b master --depth 1 https://github.com/coolsnowwolf/lede lede
cp -rf lede/target/linux/generic/hack-6.6 target/linux/generic/
wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/pending-6.6/613-netfilter_optional_tcp_window_check.patch -P target/linux/generic/pending-6.6/
wget -N https://raw.githubusercontent.com/openwrt/packages/master/libs/dmx_usb_module/patches/101-fix-kernel-6.6-builds.patch -P package/feeds/packages/dmx_usb_module/patches/
wget -N https://raw.githubusercontent.com/openwrt/openwrt/main/package/devel/kselftests-bpf/Makefile -P package/devel/kselftests-bpf/
rm -rf target/linux/generic/hack-6.6/{410-block-fit-partition-parser.patch,724-net-phy-aquantia*,720-net-phy-add-aqr-phys.patch}
