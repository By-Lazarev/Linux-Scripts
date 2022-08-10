#!/bin/bash

GREEN='\e[32m'
RED='\e[31m'
WHITE='\e[37m'
BLUE='\e[34m'
PURPLE='\e[35m'
BLACK='\e[30m'
BGGREEN='\e[42m'
BGRED='\e[41m'
BGWHITE='\e[47m'
BGBLUE='\e[44m'
BGPURPLE='\e[45m'
BGBLACK='\e[40m'
NC='\e[0m\e[49m'
TEXTBG='\e[0m'
TEXTFC='\e[0m'
RESBG='\e[0m'
RESFC='\e[0m'
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
STAT="NO"

if [ "$#" == "4" ]
then
    FIRST="1"
    LAST="6"
    for GIVEN in $1 $2 $3 $4
    do
        if (($FIRST <= $GIVEN)) && (($LAST >= $GIVEN))
        then
            STAT="OK"
        else
            STAT="NO"
            break
        fi
    done
fi


if [ $1 -eq $2 ] || [ $3 -eq $4 ]
then
    if [ $STAT == "OK" ]
    then
        printf "Chel ti cho Boba? Ti real'no khochesh odinakovi' fon i cvet teksta?\n"
        printf "Try to read this""\033[31m\033[41m""udobna, da?$NC \n"
        STAT="COLOR"
    fi
fi

if [ "$1" != "-h" ] && [ $STAT != "OK" ] && [ $STAT != "COLOR" ]
        then
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

if [[ -n  "$1" ]] && [[ "$1" == "-h" ]]
		then
              	printf "I understand. You found paradise in Ubunta. You had a good trade, you made a good living. The verter protected you and there were courts of law. So you didn't need a friend like me. Now you come and say \"Don Mainone, give me instuctions.\" But you don't ask with respect. You don't offer friendship. You don't even think to call me \"Codfather.\" You come into my house on the day my daughter is to be married and you ask me to tell you that this script work with 4 parameters only digits from 1 to 6 - but for what?\n"
fi

if [ $STAT == "OK" ]
then
case $1 in
    1)
        TEXTBG="$BGWHITE"
        ;;
    2)
        TEXTBG="$BGRED"
        ;;
    3)
        TEXTBG="$BGGREEN"
        ;;
    4)
        TEXTBG="$BGBLUE"
        ;;
    5)
        TEXTBG="$BGPURPLE"
        ;;
    *)
        TEXTBG="$BGBLACK"
        ;;
esac
case $2 in
    1)
        TEXTFC="$WHITE"
        ;;
    2)
        TEXTFC="$RED"
        ;;
    3)
        TEXTFC="$GREEN"
        ;;
    4)
        TEXTFC="$BLUE"
        ;;
    5)
        TEXTFC="$PURPLE"
        ;;
    *)
        TEXTFC="$BLACK"
        ;;
esac
case $3 in
    1)
        RESBG="$BGWHITE"
        ;;
    2)
        RESBG="$BGRED"
        ;;
    3)
        RESBG="$BGGREEN"
        ;;
    4)
        RESBG="$BGBLUE"
        ;;
    5)
        RESBG="$BGPURPLE"
        ;;
    *)
        RESBG="$BGBLACK"
        ;;
esac
case $4 in
    1)
        RESFC="$WHITE"
        ;;
    2)
        RESFC="$RED"
        ;;
    3)
        RESFC="$GREEN"
        ;;
    4)
        RESFC="$BLUE"
        ;;
    5)
        RESFC="$PURPLE"
        ;;
    *)
        RESFC="$BLACK"
        ;;
esac
fi

if [ $STAT == "OK" ]
then
	printf "$TEXTBG$TEXTFC""HOSTNAME\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$HOSTNAME"
	printf "$TEXTBG$TEXTFC""TIMEZONE\t""$NC""= ""$RESBG$RESFC""%s UTC %s%s$NC\n" "$TIMEZONE" "$UTCSIGN" "$UTC"
	printf "$TEXTBG$TEXTFC""USER\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$USER"
	printf "$TEXTBG$TEXTFC""OS\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$ISSUE"
	printf "$TEXTBG$TEXTFC""DATE\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$DATE"
	printf "$TEXTBG$TEXTFC""UPTIME\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$UPTIME"
	printf "$TEXTBG$TEXTFC""UPTIME-SEC\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$UPTIMESEC"
	printf "$TEXTBG$TEXTFC""IP\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$IP"
	printf "$TEXTBG$TEXTFC""MASK\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$MASK"
	printf "$TEXTBG$TEXTFC""GATEWAY\t\t""$NC""= ""$RESBG$RESFC""%s$NC\n" "$GATEMASK"
	printf "$TEXTBG$TEXTFC""RAM-TOTAL\t""$NC""= ""$RESBG$RESFC""%.3f GB$NC\n" "$RAMTOTAL"
	printf "$TEXTBG$TEXTFC""RAM-USED\t""$NC""= ""$RESBG$RESFC""%.3f GB$NC\n" "$RAMUSED"
    printf "$TEXTBG$TEXTFC""RAM-FREE\t""$NC""= ""$RESBG$RESFC""%.3f GB$NC\n" "$RAMFREE"
	printf "$TEXTBG$TEXTFC""SPACE-ROOT\t""$NC""= ""$RESBG$RESFC""%.2f MB$NC\n" "$SPACEROOT"
	printf "$TEXTBG$TEXTFC""SPACE-ROOT-USED\t""$NC""= ""$RESBG$RESFC""%.2f MB$NC\n" "$SPACEROOTUSED"
	printf "$TEXTBG$TEXTFC""SPACE-ROOT-FREE\t""$NC""= ""$RESBG$RESFC""%.2f MB$NC\n" "$SPACEROOTFREE"
fi

