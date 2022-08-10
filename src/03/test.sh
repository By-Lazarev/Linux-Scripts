#!/bin/sh

FIRST="1"
LAST="6"
STAT="NO"

for GIVEN in 1 2 3 4 5 64
do
    if (($FIRST <= $GIVEN)) && (($LAST >= $GIVEN))
    then
        STAT="OK"
    else
        STAT="NO"
    fi
done

echo "$STAT"
