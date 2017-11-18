#!/bin/bash

OUT_DIR=/usr/sbin
if [ -n "$1" ]; then
	if [ -d "$1" ]; then
		OUT_DIR=$1
	else
		echo "$1 is not a directory"
		exit 1
	fi
fi

cd "$( dirname "$0" )"

echo -n "> Copying scripts to $OUT_DIR ... "
cp soft-router gfwlist2dnsmasq.sh wpa_supplicant_pid.sh $OUT_DIR
echo "OK"

echo -n "> Create configure file ... "
if [ ! -f "~/.soft-router/soft-router.conf" ]; then
	if [ ! -e "~/.soft-router" ]; then
		mkdir ~/.soft-router
	fi
	cp default.soft-router.conf ~/.soft-router/soft-router.conf
fi
echo "OK"

echo "> Install completed."
