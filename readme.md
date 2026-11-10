# Magalhães Computer a la Pinto

Back in 2008, Portugal made history with a humble educational laptop called Magalhães. Now, it’s time for the ultimate software update. Lets build a new Magalhães to sail around the world and fulfill the 2008 prophecy! 🚢💻 dynamic, unstoppable, and upgraded.

PS: BTW in Linux

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
* edit user name and set the shell to bash - /bin/bash

### Install X.org

* Setup udev service - doas setup-devd udev
* Alpine have a nice script - doas setup-xorg-base

### Install Pinto DWM, ST and DWMBlocks

* Install base tools to build software - doas apk add build-base
* Install development tools for x11 - doas apk add libx11-dev libxft-dev libxinerama-dev
* Install git - doas apk add git
* Clone my repositories - PintoDWM, PintoST and PintoDWMBlocks
* Install my PintoDWM, PintoST ,PintoDWMBlocks
* Install eza setxkbmap ncurses btop firefox dysk tree
* Add keybord map for x and font - doas apk add fontconfig font-noto-emoji font-jetbrains-mono-nerd setxkbmap
* Add software that is used in PintoDWM - doas apk add mpv rofi
