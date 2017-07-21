# These are the steps highlighted in the documentation
# https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the repo
sudo apt-get update
sudo apt-get install -y docker-ce

# Give Vagrant user access to the docker socket.
sudo usermod -G docker vagrant
