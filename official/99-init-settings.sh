#!/bin/sh

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'
uci commit

# add cron job for modem l860-gl
echo '#auto renew ip lease for modem rakitan' >> /etc/crontabs/root
echo '0 0,6,16 * * * echo AT+CFUN=1,1 | atinout - /dev/ttyACM2 - && ifdown wan && sleep 3 && ifup wan' >> /etc/crontabs/root
/etc/init.d/cron restart

exit 0
