#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
rm -rf tmp
git clone -b openwrt-23.05 --depth 1 https://github.com/openwrt/openwrt.git package/23.05
rm -rf include/kernel-5.15
cp -r package/23.05/include/kernel-5.15 include/
rm -rf package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip}
cp -r package/23.05/package/boot/{arm-trusted-firmware-rockchip,uboot-rockchip} package/boot/
rm -rf target/linux/{generic,rockchip}
cp -r package/23.05/target/linux/{generic,rockchip} target/linux/
rm -rf package/23.05

git clone --depth 1 https://github.com/kiddin9/openwrt-packages.git package/kiddin
rm -rf package/network/config/{firewall4,firewall}
cp -r package/kiddin/{firewall4,firewall} package/network/config/
rm -rf package/network/utils/nftables
cp -r package/kiddin/nftables package/network/utils/
rm -rf package/libs/libnftnl
cp -r package/kiddin/libnftnl package/libs/
cp -r package/kiddin/{fullconenat-nft,fullconenat} package/
rm -rf package/kiddin

pushd target/linux/rockchip/patches-5.15/
wget -O 109-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-23.05/target/linux/rockchip/patches-5.15/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd


# other
# rm -rf package/emortal/{autosamba,ipv6-helper}
