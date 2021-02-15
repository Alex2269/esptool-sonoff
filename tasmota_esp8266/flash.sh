#!/bin/bash

export PATH=$(pwd)/../esptool:$PATH

VARIANT="ON"   # Change this to "ON"  if you want that your Sonoff will be OFF when powered
# VARIANT="OFF"   # Change this to "OFF" if you want that your Sonoff will be OFF when powered
# VARIANT="basic"   # Change this to "Sonoff_basic.bin" version
# VARIANT="OTA"   # alternative OTA

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
            0x0000 firmware/tasmota-sensors.bin

