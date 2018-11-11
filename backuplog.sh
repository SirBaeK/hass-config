#!/bin/bash
logfile="home-assistant"
number=0

while test -e "/home/homeassistant/.homeassistant/$logfile$suffix.log"; do
    (( ++number ))
    suffix="$( printf -- '-%02d' "$number" )"
done

fname="$logfile$suffix.log"

printf 'Will use "%s" as filename\n' "$fname"
cp /home/homeassistant/.homeassistant/home-assistant.log /home/homeassistant/.homeassistant/$fname
