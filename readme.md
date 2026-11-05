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

### Install Bash

* doas apk add bash
* doas usermod -s /bin/bash user

### Install X.org

* doas setup-xorg-base

### Tweak some styuff

* 

### Install Pinto DWM, ST and DWMBlocks

* 
