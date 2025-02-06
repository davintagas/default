#!/bin/sh

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'
uci commit

sed -i '/modemfeed/d' /etc/opkg/distfeeds.conf
sed -i '/4icg/d' /etc/opkg/distfeeds.conf
sed -i '/internet/d' /etc/opkg/distfeeds.conf
sed -i '/zapret/d' /etc/opkg/distfeeds.conf
sed -i '/sms/d' /etc/opkg/distfeeds.conf

exit 0
