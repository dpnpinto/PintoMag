# Magalhães Computer a la Pinto

Back in 2008, Portugal made history with a humble educational laptop called Magalhães. Now, it’s time for the ultimate software update. Lets build a new Magalhães to sail around the world and fulfill the 2008 prophecy! 🚢💻 dynamic, unstoppable, and upgraded.

PS: BTW with Linux

## STEPS

Let's do it. Do it yourself. Do it with your son. Just do it and have fun.

### Download Alpine

* Go to Alpine Linux site - https://www.alpinelinux.org
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

* doas apk add bash bash-completion
* edit user name and set the shell to bash - /bin/bash

### Install X.org

* Setup udev service - doas setup-devd udev
* Alpine have a nice script - doas setup-xorg-base

### Install SuckLess Terminal (PintoST)

* Install git - doas apk add git
* Instal the font that I use - doas apk add font-jetbraind-mono-nerd
* Install base develop tools - doas apk add build-base
* Install development libs for x11 - doas apk add ncurses libx11-dev libxft-dev libxinerama-dev
* Clone my ST - git clone https://github.com/dpnpinto/PintoST
* Install PintoST - cd PintoST && make clean install

### Install SuckLess Bar for Windows Manager (PintoDWMBlocks)

* Clone my DWM Bar - git clone https://github.com/dpnpinto/PintoDWMBlocks
* Install PintoDWMBlocks - cd PintoDWMBlock && doas make clean install
* Copy scripts to .confog - makedir ~/.config/scripts && cp ~/PintoDWMBlocks/scrips/* ~/.config/scrips/
* Change file permitions to execute - chmod 755 ~/.config/scripts/*
  
### Install SuckLess Windows Manager (PintoDWM)

* Clone my repositorie of DWM - git clone https://github.com/dpnpinto/PintoDWM
* Install my PintoDWM - cd PintoDWM && doas make clean install
* Add font emoji - doas apk add font-noto-emoji
* Add keybord map for x - doas apk add setxkbmap
* Add software that is used in PintoDWM - doas apk add mpv maim rofi badwolf pcmanfm
