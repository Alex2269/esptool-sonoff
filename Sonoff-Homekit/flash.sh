#!/bin/bash

export PATH=$(pwd)/../esptool:$PATH

VARIANT="ON" # Change this to "OFF" if you want that your Sonoff will be OFF when powered 
# VARIANT="OFF" # Change this to "OFF" if you want that your Sonoff will be OFF when powered 
# VARIANT="OTA" # alternative OTA 

SONOFF_PORT="/dev/ttyUSB0"

esptool.py \
            -p $SONOFF_PORT \
            --baud 115200 \
            write_flash \
            -fs 8m \
            -fm dout \
            -ff 40m \
            0x0 ./firmware/rboot.bin \
            0x1000 ./firmware/blank_config.bin \
            0x2000 ./firmware/Sonoff_$VARIANT.bin

