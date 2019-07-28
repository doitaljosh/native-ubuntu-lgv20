Native Ubuntu for the LG V20

# Requirements:
- Computer
- Unlocked bootloader
- TWRP installed

# How to install:
- Clone this GitHub repo to your computer. If on a Windows machine, download through browser and extract it.
- Download the rootfs using the google drive link found in this readme. Copy it to the native-ubuntu-lgv20 folder.
- If you are installing Ubuntu to an SD card, copy the folder to your phone's internal storage.
- If you are installing Ubuntu to the internal storage, copy the folder to your phone's SD card.
- Boot into TWRP, then open Advanced->Terminal.
- ```cd``` to either ```/sdcard/native-ubuntu-lgv20``` (installing to SD) or ```/external_sd/native-ubuntu-lgv20``` (installing to internal).
- Run ```./install.sh sdcard``` or ```./install.sh internal```. For help, run ```./install.sh help```
- Wait for the process to complete.
