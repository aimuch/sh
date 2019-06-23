#!/bin/bash
# Author: Andy Liu
# Program:
#   The program install ai envirnment in one touch.
# History:
#   23/06/2019  Andy  First Realse

## NVIDIA Driver
# update
sudo apt-get update
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install libopenblas-dev liblapack-dev libatlas-base-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt-get install git cmake build-essential

# ban nouveau driver
sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo service lightdm stop
sudo apt-get purge nvidia*

read -p "Which Version : [390|415|418]" nvidia_version
if [ "${nvidia_version}" == "418" ]; then
    echo "Now install NVIDIA-418 ... "
    sudo apt-get install nvidia-418 nvidia-settings nvidia-prime
    echo "Done"
elif [ "${nvidia_version}" == "415" ]; then
    echo "Now install NVIDIA-415 ... "
    sudo apt-get install nvidia-415 nvidia-settings nvidia-prime
    echo "Done"
elif [ "${nvidia_version}" == "390" ]; then
    echo "Now install NVIDIA-390 ... "
    sudo apt-get install nvidia-390 nvidia-settings nvidia-prime
    echo "Done"

echo "# NVIDIA" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH" >> ~/.bashrc
source  ~/.bashrc
