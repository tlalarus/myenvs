#!/bin/bash

# Get Absolute path
SOURCE="${BASH_SOURCE[0]}"

sudo mv xicamtool.desktop xicop.desktop /usr/share/applications/

mv XIMEA_Linux_SP.tgz /opt/
cd /opt
tar -xzf XIMEA_Linux_SP.tgz

echo "Install Ximea linux package..."
cd /opt/package
sudo ./install

echo "remove USB buffer size limitation..."
sudo tee /sys/module/usbcore/parameters/usbfs_memory_mb >/dev/null <<<0

# Set env var
echo "# XIMEA initialize" >> $HOME/.bashrc
echo "export XIMEA_HOME=/opt/XIMEA" >> $HOME/.bashrc
echo "export PATH=$PATH:$XIMEA_HOME/bin" >> $HOME/.bashrc
source $HOME/.bashrc


