#!/bin/bash
# add your IP
IP="XXXXX"
INFO="/root/cloudflare/notice/down"
TIMEOUT=5
COUNT=2
pingcount=$(ping -c ${COUNT} -w ${TIMEOUT} ${IP} |grep received|awk -F',' '{print $2}'|awk '{print $1}')

  if [ $pingcount -eq 0 ]; then
	if [ -f $INFO ]
	then
		logger -t `basename $0` Maxindo IX masih mengalami downtime $IP
	else
		logger -t `basename $0` Maxindo IX baru saja DOWN - $IP
echo "Maxindo IX baru saja DOWN - $IP - Detected dari server ssd.nyit-nyit.net $(date) - Cloudflare OFF" |mail -s "Maxindo IX" email
echo "Maxindo IX baru saja DOWN - $IP - Detected dari server ssd.nyit-nyit.net $(date)" |mail -s "Maxindo IX" sysadmin@email
/root/cloudflare/off/cloud-off-cdn.nyit-nyit.net.sh
/root/cloudflare/off/cloud-off-images.nyit-nyit.net.sh
/root/cloudflare/off/cloud-off-nyit-nyit.net.sh
/root/cloudflare/off/cloud-off-www.nyit-nyit.net.sh
	  	touch $INFO
	fi

 	else
		if [ -f $INFO ]
	then
		logger -t `basename $0` Maxindo IX baru saja UP - $IP
echo "Maxindo IX baru saja UP - $IP - Detected dari server ssd.nyit-nyit.net $(date) - Cloudflare ON" |mail -s "Maxindo IX" email
echo "Maxindo IX baru saja UP - $IP - Detected dari server ssd.nyit-nyit.net $(date)" |mail -s "Maxindo IX" sysadmin@email
/root/cloudflare/on/cloud-on-nyit-nyit.net.sh
/root/cloudflare/on/cloud-on-www.nyit-nyit.net.sh
/root/cloudflare/on/cloud-on-cdn.nyit-nyit.net.sh
/root/cloudflare/on/cloud-on-images.nyit-nyit.net.sh
		rm -rf $INFO
	else
                logger -t `basename $0` Maxindo IX masih berjalan lancar jaya $IP

		fi
  fi
