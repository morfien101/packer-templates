if [ -f /etc/redhat-release ]; then
  # Figure out this for redhat/CentOS
  sudo yum install -y vim man
elif [[ $(lsb_release -i | awk '{print $3}') == "Ubuntu" ]]; then
  sudo apt-get install -y vim man
fi
