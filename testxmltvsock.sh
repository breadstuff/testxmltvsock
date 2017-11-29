#!/bin/bash
# testxmltvsock.sh, by exzessiv@onlinehome.de
#
# this script:
#                               1. Tests if xmltv.sock is available.
#
# requirements: ss
#
#
# command line: ./testxmltvsock.sh
#
# todo
#

service tvheadend stop
echo TVH stop
sleep 10
service tvheadend start
echo TVH start

ss -x -a | grep "/home/hts/.hts/tvheadend/epggrab/xmltv.sock" >/dev/null
i=$?
#echo Status xmltv.sock $i
while [ $i -eq 1 ]
        do
        ss -x -a | grep "/home/hts/.hts/tvheadend/epggrab/xmltv.sock" >/dev/null
        i=$?
        echo status xmltv.sock - socket not available!
        sleep 10
done
        echo status xmltv.sock - socket available!
