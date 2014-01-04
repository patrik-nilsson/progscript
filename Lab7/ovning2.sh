#!/bin/bash
dialog --inputbox "DHCP Net-ID (Ex: 192.168.1.0)" 10 60 2>/tmp/netid
dialog --inputbox "DHCP Netmask (Ex: 255.255.255.0)" 10 60 2>/tmp/netmask
dialog --inputbox "DHCP IP-pool range (Ex: 192.168.1.100 192.168.1.150)" 10 60 2>/tmp/range
dialog --inputbox "DNS IP (Ex: 8.8.8.8)" 10 60 2>/tmp/DNS
dialog --inputbox "Default GateWay IP (Ex: 192.168.1.1)" 10 60 2>/tmp/router
dialog --inputbox "Default lease time (Default setting: 34567" 10 60 2>/tmp/lease
dialog --inputbox "Max lease time (Default setting: 69120" 10 60 2>/tmp/maxlease
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
