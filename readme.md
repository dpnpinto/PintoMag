# Magalhães Computer a la Pinto


## Steps

### Install Alpine

* Download the correct iso
* Burn the iso to a PEN USB doas dd if=Image.iso of=/dev/"usbdevice"

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

