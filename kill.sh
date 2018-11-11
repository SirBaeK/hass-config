#!/bin/bash
#list all prcesses-> find only hass-> print only secont column, where is PID->cut last record, because its this searching...
for PROG in $(ps aux | grep hass | awk '{print $2}' | head -n -1)
do
	echo $PROG killed
done
for PID in $(ps aux | grep hass | awk '{print $2}' | head -n -1)
do
	kill -9 $PID
done


