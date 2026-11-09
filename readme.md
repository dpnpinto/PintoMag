# Magalhães Computer a la Pinto


## Steps

### Download Alpine

* Go to alpine site - https://www.alpinelinux.org
* Download the correct iso - https://www.alpinelinux.org/downloads/
* Make the USB boot, put the iso to the USB - sudo dd status=progress conv=fsync if=Image.iso of=/dev/"usbdevice"

### Install Alpine

* Boot from the pre made usb
* Login with user root and no passwd
* Run the setup script of Alpine Linux - setup-alpine

### Update stuff

* Change to roling release (edge) - Edit /etc/apk/repostitories
* Update and upgrade - doas apk upgrade
* add vim - apk add vim
* Let's put a nice kernel in this - doas apk add linux-stable
* For automatic boot from this kernel edit - vim extlinux.conf
* reboot
* Add Nice stuff -  apk add htop fastfetch

### Install Bash

* doas apk add bash
* edit user name and sett the shel to bash - /bin_/bash

### Install X.org

* Alpine have a nice script -doas setup-xorg-base

### Install Pinto DWM, ST and DWMBlocks

* Install base tools to build software - doas apk add build-base
* Install development tools for x11 - doas apk add libx11-dev libxft-dev libxinerama-dev
* Install git - doas apk add git
* Clone my repositories - PintoDWM, PintoST and PintoDWMBlocks
* Install my PintoDWM, PintoST ,PintoDWMBlocks
* Install eza setxkbmap ncurses btop firefox dysk tree
