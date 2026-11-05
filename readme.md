# Magalhães Computer a la Pinto


## Steps

### Install Alpine

* Go to alpine site - https://www.alpinelinux.org
* Download the correct iso - https://www.alpinelinux.org/downloads/
* Burn the iso to a PEN USB - sudo dd status=progress conv=fsync if=Image.iso of=/dev/"usbdevice"

### Install Bash

* doas apk add bash
* doas usermod -s /bin/bash user

### Install Wayland

* doas setup-wayland-base
*

### Install MangoWM

* doas apk add mangowm
* mkdir -p ~/.config/mango
* PintoMAG:~$ cp /etc/mango/config.conf ~/.config/mango/config.conf

