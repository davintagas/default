#!/bin/sh

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'
uci commit

# add cron job for modem l860-gl
echo '#auto renew ip lease for modem rakitan' >> /etc/crontabs/root
echo '0 0,6,16 * * * sh -i /usr/lib/rooter/connect/reconnect.sh 1' >> /etc/crontabs/root
echo '*/30 * * * * sync && echo 3 > /proc/sys/vm/drop_caches' >> /etc/crontabs/root
/etc/init.d/cron restart

exit 0
