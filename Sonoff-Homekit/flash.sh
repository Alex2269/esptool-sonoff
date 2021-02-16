#!/bin/bash

export PATH=$(pwd)/../esptool:$PATH

VARIANT="haaboot"
# VARIANT="Sonoff_basic"    # Change this to "Sonoff_basic.bin" version
# VARIANT="Sonoff_OFF"    # Change this to "OFF" if you want that your Sonoff will be OFF when powered
# VARIANT="Sonoff_ON"    # Change this to "ON"  if you want that your Sonoff will be OFF when powered
# VARIANT="Sonoff_OTA"    # alternative OTA

SONOFF_PORT="/dev/ttyUSB0"

esptool.py \
            -p $SONOFF_PORT \
            --baud 115200 \
            write_flash \
            -fs 8m \
            -fm dout \
            -ff 40m \
            0x0 firmware/rboot.bin \
            0x1000 firmware/blank_config.bin \
            0x2000 firmware/$VARIANT.bin

