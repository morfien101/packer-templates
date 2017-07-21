GOVERSION=1.8.1

sudo apt-get install wget -y

wget https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz \
    -O /tmp/go$GOVERSION.linux-amd64.tar.gz \
&& sudo tar -C /usr/local \
       -xzf /tmp/go$GOVERSION.linux-amd64.tar.gz

if [ -f /etc/redhat-release ]; then
  # Figure out this for redhat/CentOS
  echo "Make REDHAT go path script"
elif [[ $(lsb_release -i | awk '{print $3}') == "Ubuntu" ]]; then
  echo "Setup Ubuntu GOPATH"
  # /etc/profile is what ubuntu uses to create the bash profile when you login.
  # /etc/profile.d/*.sh are loaded at login.
  if [ ! -d /etc/profile.d ]; then
    sudo mkdir -p /etc/profile.d \
    && sudo chown root:root /etc/profile.d
  fi
  echo "export PATH=$PATH:/usr/local/go/bin" > /tmp/setup_go_path.sh \
  && sudo chmod 644 /tmp/setup_go_path.sh \
  && sudo chown root:root /tmp/setup_go_path.sh \
  && sudo mv /tmp/setup_go_path.sh /etc/profile.d/setup_go_path.sh
fi
