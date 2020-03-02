/bin/bash
_IP=`ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
hostnamectl set-hostname foreman.example.com
echo "$_IP foreman.example.com" | sudo tee -a /etc/hosts
sudo apt -y update
sudo apt -y install ca-certificates wget
wget https://apt.puppetlabs.com/puppet-release-bionic.deb
sudo dpkg -i puppet-release-bionic.deb
rm puppet-release-bionic.deb
echo "deb http://deb.theforeman.org/ bionic 1.23" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.23" | sudo tee -a /etc/apt/sources.list.d/foreman.list
sudo apt -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -
sudo apt update
sudo apt -y install foreman-installer
