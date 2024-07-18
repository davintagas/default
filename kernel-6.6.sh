#!/bin/bash

git clone -b main --depth 1 https://github.com/openwrt/openwrt.git main
cp -r main/target/linux/rockchip/patches-6.6 target/linux/rockchip/
cp -r main/target/linux/rockchip/armv8/config-6.6 target/linux/rockchip/armv8/
cp -r main/target/linux/generic/{backport-6.6,hack-6.6,pending-6.6,config-6.6} target/linux/generic/
cp -r main/include/kernel-6.6 include/
rm -rf main
