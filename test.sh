#!/bin/bash

SESSION_FILE=abc.dat
touch $SESSION_FILE

readsession() {
	if [ -f $SESSION_FILE -a -n "$1" ]; then
		cat $SESSION_FILE | grep ^$1= | cut -f 2 -d =
	fi
}

savesession() {
	if [ -f $SESSION_FILE -a -n "$1" -a -n "$2" ]; then
		if [ -n "`cat $SESSION_FILE | grep ^$1=`" ]; then
			sed -i '/^'$1'=/d' $SESSION_FILE
		fi
	echo "$1=$2" >> $SESSION_FILE
	fi
}

deletesession() {
	if [ -f $SESSION_FILE -a -n "$1" ]; then
		if [ -n "`cat $SESSION_FILE | grep ^$1=`" ]; then
			sed -i '/^'$1'=/d' $SESSION_FILE
		fi
	fi
}

savesession abc aaaaaa
savesession pabc 666aa
savesession abc abbbaa
sleep 1
if [ "`readsession pabc`" != "666aa" ]; then
	echo "error1"
fi
if [ "`readsession abc`" != "abbbaa" ]; then
	echo "error2"
fi
deletesession abc
if [ -n "`readsession abc`" ]; then
	echo "error3"
fi
