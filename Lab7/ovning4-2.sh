#!/bin/bash
zenity --entry \
 --title= "dhcpd.conf" \
 --text="DHCP Net-ID" \
 --entry-text "(Ex: 192.168.1.0)" \
>/tmp/netid

zenity --entry \
 --title="dhcpd.conf" \
 --text="DHCP Netmask" \
 --entry-text "(Ex: 255.255.255.0)" \
>/tmp/netmask

zenity --entry \
 --title="dhcpd.conf" \
 --text="DHCP IP-pool range" \
 --entry-text "(Ex: 192.168.1.100 192.168.1.150)" \
>/tmp/range

zenity --entry \
 --title="dhcpd.conf" \
 --text="DNS IP" \
 --entry-text "(Ex: 8.8.8.8)" \
>/tmp/DNS

zenity --entry \
 --title="dhcpd.conf" \
 --text="Default GateWay IP" \
 --entry-text "(Ex: 192.168.1.1)" \
>/tmp/router

zenity --entry \
 --title="dhcpd.conf" \
 --text="Default lease time" \
 --entry-text "(Default setting: 34567" \
>/tmp/lease

zenity --entry \
 --title="dhcpd.conf" \
 --text="Max lease time" \
 --entry-text "(Default setting: 69120" \
>/tmp/maxlease

Subnet=`cat /tmp/netid`
Netmask=`cat /tmp/netmask`
Range=`cat /tmp/range`
Dns=`cat /tmp/DNS`
Router=`cat /tmp/router`
Lease=`cat /tmp/lease`
Maxlease=`cat /tmp/maxlease`
echo "subnet $Subnet netmask $Netmask {" >$HOME/dhcpd.conf
echo "range $Range;" >>$HOME/dhcpd.conf
echo "option domain-name-servers $Dns;" >>$HOME/dhcpd.conf
echo "option routers $Router;" >>$HOME/dhcpd.conf
echo "ddns-update-style none;" >>$HOME/dhcpd.conf
echo "default-lease-time $Lease;" >>$HOME/dhcpd.conf
echo "max-lease-time $Maxlease;" >>$HOME/dhcpd.conf
echo "}" >>$HOME/dhcpd.conf

exit 0
