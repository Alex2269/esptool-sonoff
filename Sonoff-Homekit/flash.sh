#!/bin/bash

export PATH=$(pwd)/../esptool:$PATH

VARIANT="haaboot"
# VARIANT="Sonoff_basic"    # Change this to "Sonoff_basic.bin" version
# VARIANT="Sonoff_OFF"    # Change this to "OFF" if you want that your Sonoff will be OFF when powered
# VARIANT="Sonoff_ON"    # Change this to "ON"  if you want that your Sonoff will be OFF when powered
# VARIANT="Sonoff_OTA"    # alternative OTA

PORT="/dev/ttyUSB0"
SPEED="460800"
FLASH_SIZE="1MB"

esptool.py \
            --chip esp8266 \
            --port $PORT \
            --baud $SPEED \
            erase_flash

esptool.py \
            --chip esp8266 \
            --port $PORT \
            --baud $SPEED \
            write_flash \
            -fs $FLASH_SIZE \
            -fm dout \
            -ff 40m \
            0x0 firmware/rboot.bin \
            0x1000 firmware/blank_config.bin \
            0x2000 firmware/$VARIANT.bin

