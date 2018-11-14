#!/bin/bash
#Made by SirBaeK 11/2018
#list and kill all hass prcesses-> find only hass-> print only secont column, where is PID->cut last record, because it is this greping... -> and say byebye to these processes
for PROG in $(ps aux | grep hass | awk '{print $2}' | head -n -1)
do
	echo $PROG killed
done
for PID in $(ps aux | grep hass | awk '{print $2}' | head -n -1)
do
	sudo kill -9 $PID
done


