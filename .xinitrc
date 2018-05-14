#! /bin/sh
while true 
do
    CPU=$(iostat -ch | grep "  [0-9].[0-9]\%" | awk '{ print $6}')
    RAM=$(free -h --si| grep Mem |awk '{print $3}')
    NET=$(nmcli c | grep wlan0 | awk '{print $1}')
    IP=$(ip a | grep "noprefixroute wlan0" | sed 's/\// /g' | awk '{print $2}')
    VOL=$(amixer | grep Playback | tail -n 1 | awk '{print $5}')
    DATE=$(date +"%a %b %d %R")
    xsetroot -name  "Cpu:$CPU || Mram:$RAM || Network:$NET || Ip:$IP || Vol:$VOL || $DATE"
    sleep 1s
done &
exec dwm
