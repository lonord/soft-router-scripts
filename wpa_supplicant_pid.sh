#!/bin/bash

if [ ! -n "$1" ]; then
	echo "Usage: <ifname>"
	exit 0
fi

inode=`cat /proc/net/unix | grep /$1 | cut -d " " -f 7`
if [ ! -n "$inode" ]; then
	exit 0
fi


wpaPids=`pgrep wpa_supplicant`

if [ ! -n "$wpaPids" ]; then
	exit 0
fi

for pid in $wpaPids
do
	found=`ls -l /proc/$pid/fd | grep socket: | grep $inode`
	if [ -n "$found" ]; then
		echo $pid
	fi
done

