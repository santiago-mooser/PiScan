#!/bin/bash
#start TCP dump in the background
while :
do
    sudo nohup tcpdump -i wlan0 -G 15 -e -s 0 -l type mgt subtype probe-req or type data subtype null or type mgt subtype assoc-req or type mgt subtype reassoc-req | grep -P --line-buffered -o '(?<=SA:)(([a-f]|[0-9]){2}:){5}([a-f]|[0-9]){2}' | md5sum | cut -d ' ' -f 1 | sort -u >> /temp/$EPOCHSECONDS.txt
    sleep 5
done
