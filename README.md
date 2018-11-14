                                   Home-Assistant – Python 3.6 Virtual Environment
                                                        AUTOMATIZER


Automate dependency downloading, install all the necessary packages, and launch Home-Assistant as a new homeassistant user in Python 3.6 Virtual Environment v / opt / homeassistant. Basically, it's the official installer from the site. But sometimes there are some of my official improvements that can / must be modified.

Irregularly  updated, not tweaked, this configuration work for me nice :)

Use, Modify,Tweak, Its OpenSource, for Everybody ...

SirBaeK


backuplog.sh
  - no option, can be used standalone, bud, i using it in starting script to hass
  - some information in script
  - TODO: make from multiple log one log
  
kill.sh
  - usable standalone to kill all hass processes using name(not PID), if someone starts multiple
  - TODO: make it multipurpose, to kill process with name, not PID

hass.sh
  - before exetute something, make backup home-assistant.log
  - its multipurpose downloader,installer,configurer,cleaner and starter homeassistant - more info in script
  - usage:
    -p|python)
    -a|adduser)
    -u|upgrade)
    -c|clear)
    -i|install)
    -s|start)
  - TODO: rewrite script, use variables, add help,

























