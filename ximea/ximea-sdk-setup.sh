#!/bin/bash


# Get Absolute path
SOURCE="${BASH_SOURCE[0]}"

# Change apt server & update
sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sed -i 's/extras.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
apt-get update

echo "Install requirements..."
sudo apt-get install -y wget build-essential
wget https://www.ximea.com/downloads/recent/XIMEA_Linux_SP.tgz -O /opt/XIMEA_Linux_sp.tgz
cd /opt
tar xzf XIMEA_Linux_SP.tgz

echo "Install Ximea linux package..."
sudo ./package/install

echo "remove USB buffer size limitation"
sudo tee /sys/module/usbcore/parameters/usbfs_memory_mb >/dev/null <<<0

