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
* doas usermod -s /bin/bash $user

### Install X.org

* doas setup-xorg-base

### Tweak some stuff

* 

### Install Pinto DWM, ST and DWMBlocks

* 
