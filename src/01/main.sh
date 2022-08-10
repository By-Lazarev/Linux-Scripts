#!/bin/bash

GREEN='\e[32m'
RED='\e[31m'
NC='\e[0m'
re='^[0-9]*$'

if [ "$#" == 1 ]
then
	if [ $1 == "-h" ]
	then
		printf "I understand. You found paradise in Ubunta. You had a good trade, you made a good living. The verter protected you and there were courts of law. So you didn't need a friend like me. Now you come and say \"Don Mainone, give me instuctions.\" But you don't ask with respect. You don't offer friendship. You don't even think to call me \"Codfather.\" You come into my house on the day my daughter is to be married and you ask me to tell you that this script return only text and not numbers - but for what?\n"
	else
		if [[ $1 =~ $re ]]
		then
			printf "$RED YOU PICKED THE WRONG HOUSE FOOL $NC\n"
		else
			printf "$1\n"
		fi
	fi
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
