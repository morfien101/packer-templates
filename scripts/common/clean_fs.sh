#!/bin/bash

# remove any temp files.
sudo rm -rf /tmp/*

# clean the log files
for logfile in $(sudo find /var/log -type f | grep "\.log"); do
  sudo rm -f $logfile \
  && sudo touch $logfile
done

if [[ $(lsb_release -i | awk '{print $3}') == "Ubuntu" ]]; then
  sudo rm -f /var/log/syslog \
  && sudo touch /tmp/syslog \
  && sudo chmod 640 /tmp/syslog \
  && sudo chown syslog:adm /tmp/syslog \
  && sudo mv /tmp/syslog /var/log/syslog
fi

if [ -f ~/.bash_history ]; then
  echo "" > ~/.bash_history
fi
