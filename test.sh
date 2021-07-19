#!/bin/bash

# remove first
sudo update-alternatives --remove default.plymouth /usr/share/plymouth/themes/hanla/hanla.plymouth 
sudo rm -rf /usr/share/plymouth/themes/hanla
sudo cp -av usr/share/plymouth/themes/hanla /usr/share/plymouth/themes

sudo update-alternatives \
    --install /usr/share/plymouth/themes/default.plymouth default.plymouth \
    /usr/share/plymouth/themes/hanla/hanla.plymouth 100

sudo update-alternatives --config default.plymouth  #here, choose the number of the theme you want to use then hit enter
sudo update-initramfs -u
#sudo apt-get install plymouth-x11

echo
echo Running 10-second test...
sudo plymouthd ; sudo plymouth --show-splash ; for ((I=0; I<5; I++)); do sleep 1 ; sudo plymouth --update=test$I ; done ; sudo plymouth --quit
exit

