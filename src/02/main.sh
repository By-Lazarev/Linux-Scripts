#!/bin/bash

GREEN='\e[32m'
RED='\e[31m'
NC='\e[0m'
re='^[0-9]*$'
HOSTNAME=`cat /etc/hostname`
TIMEZONE=`cat /etc/timezone`
UTCSIGN=`date "+%::z" | grep "^[+-]" -o`
UTC=`date "+%::z" | grep "[0-9]" -o | head -c 1`
UTC2=`date "+%::z" | grep "[0-9]" -o | grep "" -m 2 | tail -c 2`
[ $UTC == 0 ] && UTC="$UTC2" || UTC="$UTC$UTC2"
USER=`whoami`
ISSUE=`cat /etc/issue`
DATE=`date "+%d %b %Y %H:%M:%S"`
UPTIME=`uptime -p`
UPTIMESEC=`grep "^.* " -o /proc/uptime`
IP=`hostname -i | awk '{print$1}'`
MASK=`ip a | grep "/[0-9]* " -o | grep "" -m 1`
GATEMASK=`ip r | grep "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]* " -o | grep "" -m 1`
RAMTOTAL=`free | head -2 | tail -1 | awk '{printf "%.3f",  ($2/1048576)}'`
RAMUSED=`free | head -2 | tail -1 | awk '{printf "%.3f",  ($3/1048576)}'`
RAMFREE=`free | head -2 | tail -1 | awk '{printf "%.3f",  ($4/1048576)}'`
SPACEROOT=`df ~/ | tail -1 | awk '{printf "%.2f", ($2/1024)}'`
SPACEROOTUSED=`df ~/ | tail -1 | awk '{printf "%.2f", ($3/1024)}'`
SPACEROOTFREE=`df ~/ | tail -1 | awk '{printf "%.2f", ($4/1024)}'`
FILENAME=`date "+%d_%m_%y_%H_%M_%S"`

if [ -n "$1" ]
then

	if [ $1 == "-h" ]
		then
              	printf "I understand. You found paradise in Ubunta. You had a good trade, you made a good living. The verter protected you and there were courts of law. So you didn't need a friend like me. Now you come and say \"Don Mainone, give me instuctions.\" But you don't ask with respect. You don't offer friendship. You don't even think to call me \"Godfather.\" You come into my house on the day my daughter is to be married and you ask me to tell you that this script work with no argumets - but for what?\n"
		else
        printf "$GREEN ---            HELLO          --- $NC\n"
        printf "To use this
        \e[31m                _       _
        \e[32m               (_)     | |
        \e[33m  ___  ___ _ __ _ _ __ | |_
        \e[34m / __|/ __| '__| | '_ \| __|
        \e[35m \__ | (__| |  | | |_) | |_
        \e[36m |___/\___|_|  |_| .__/ \__|
        \e[2;31m                 | |
        \e[2;32m                 |_|
$NC you need to be smart enough, but if you are not try to use -h\n"
        printf "\n$GREEN --- HAVE A NICE EVERYTHING! --- $NC\n"
	fi
else
	printf "HOSTNAME\t= %s\n" "$HOSTNAME"
	printf "TIMEZONE\t= %s UTC %s%s\n" "$TIMEZONE" "$UTCSIGN" "$UTC"
	printf "USER\t\t= %s\n" "$USER"
	printf "OS\t\t= %s\n" "$ISSUE"
	printf "DATE\t\t= %s\n" "$DATE"
	printf "UPTIME\t\t= %s\n" "$UPTIME"
	printf "UPTIME-SEC\t= %s\n" "$UPTIMESEC"
	printf "IP\t\t= %s\n" "$IP"
	printf "MASK\t\t= %s\n" "$MASK"
	printf "GATEWAY\t\t= %s\n" "$GATEMASK"
	printf "RAM-TOTAL\t= %.3f GB\n" "$RAMTOTAL"
	printf "RAM-USED\t= %.3f GB\n" "$RAMUSED"
    printf "RAM-FREE\t= %.3f GB\n" "$RAMFREE"
	printf "SPACE-ROOT\t= %.2f MB\n" "$SPACEROOT"
	printf "SPACE-ROOT-USED\t= %.2f MB\n" "$SPACEROOTUSED"
	printf "SPACE-ROOT-FREE\t= %.2f MB\n" "$SPACEROOTFREE"
    printf "Would you kindly like to let me save this info? Y/n"
    read -s answer
    printf "\n"

    if [[ "$answer" == "y" ]] || [[ "$answer" == "Y" ]]
        then
        printf "HOSTNAME\t= %s\n" "$HOSTNAME" > $FILENAME.status
	    printf "TIMEZONE\t= %s UTC %s%s\n" "$TIMEZONE" "$UTCSIGN" "$UTC" >> $FILENAME.status
    	printf "USER\t\t= %s\n" "$USER" >> $FILENAME.status
	    printf "OS\t\t= %s\n" "$ISSUE" >> $FILENAME.status
	    printf "DATE\t\t= %s\n" "$DATE" >> $FILENAME.status
	    printf "UPTIME\t\t= %s\n" "$UPTIME" >> $FILENAME.status
    	printf "UPTIME-SEC\t= %s\n" "$UPTIMESEC" >> $FILENAME.status
	    printf "IP\t\t= %s\n" "$IP" >> $FILENAME.status
    	printf "MASK\t\t= %s\n" "$MASK" >> $FILENAME.status
    	printf "GATEWAY\t\t= %s\n" "$GATEMASK" >> $FILENAME.status
    	printf "RAM-TOTAL\t= %.3f GB\n" "$RAMTOTAL" >> $FILENAME.status
    	printf "RAM-USED\t= %.3f GB\n" "$RAMUSED" >> $FILENAME.status
        printf "RAM-FREE\t= %.3f GB\n" "$RAMFREE" >> $FILENAME.status
    	printf "SPACE-ROOT\t= %.2f MB\n" "$SPACEROOT" >> $FILENAME.status
    	printf "SPACE-ROOT-USED\t= %.2f MB\n" "$SPACEROOTUSED" >> $FILENAME.status
    	printf "SPACE-ROOT-FREE\t= %.2f MB\n" "$SPACEROOTFREE" >> $FILENAME.status
        printf "All info in %s"".status now\n" "$FILENAME"
    else
        printf "Pidora otvet)\n"
    fi
fi
