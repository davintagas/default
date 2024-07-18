#!/bin/sh

# Set Timezone to Asia/Jakarta
uci set system.@system[0].timezone='WIB-7'
uci set system.@system[0].zonename='Asia/Jakarta'
uci commit

# add cron job for modem l860-gl
echo '# Auto Renew IP lease for Modem Rakitan' >> /etc/crontabs/root
echo '30 3 * * * echo AT+CFUN=15 | atinout - /dev/ttyACM2 -' >> /etc/crontabs/root
echo '*/30 * * * * sync && echo 3 > /proc/sys/vm/drop_caches' >> /etc/crontabs/root
/etc/init.d/cron restart

chmod +x /usr/bin/cpustat
chmod +x /etc/profile.d/30-sysinfo.sh
sed -i 's|/bin/ash|/bin/bash|g' /etc/passwd

exit 0
