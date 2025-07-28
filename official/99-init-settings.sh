#!/bin/sh

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'
uci commit

sed -i '/l860/d' /etc/opkg/distfeeds.conf
sed -i 's|ash|bash|g' /etc/passwd

exit 0
