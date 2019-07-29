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
- Boot into TWRP, then wipe data if you are installing to internal storage. Use an empty ext4 formatted SD card if installing to the SD card. 
- Restart TWRP after wiping data or sdcard.
- Open Advanced->Terminal.
- ```cd``` to either ```/sdcard/native-ubuntu-lgv20``` (installing to SD) or ```/external_sd/native-ubuntu-lgv20``` (installing to internal).
- Run ```sh install.sh sdcard``` or ```sh install.sh internal```. For help, run ```sh install.sh help```
- Wait for the process to complete.

# Rootfs download link: (was too large for GitHub)
Link: [ubuntu-1804-r0.2-elsa.tar.gz](https://drive.google.com/open?id=1bwg7jDnIl-fbfcCYbTI9GvaT5KOIRtxh)

## Default login
### Username: ```ubuntu```
### Password: ```ubuntu```
