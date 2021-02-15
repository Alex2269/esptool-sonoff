#!/bin/sh

export PATH=$(pwd)/esptool:$PATH

# These files are needed for flashing Tasmota32 with esptool.py to an ESP32.
PORT="/dev/ttyUSB0"
SPEED="460800"

esptool.py \
            --chip esp32 \
            --port $PORT \
            --baud $SPEED \
            erase_flash

esptool.py \
            --chip esp32 \
            --port $PORT \
            --baud $SPEED \
            --before default_reset \
            --after hard_reset write_flash -z \
            --flash_mode dout \
            --flash_freq 40m \
            --flash_size detect \
            0x1000 firmware/Tasmota32/bootloader_dout_40m.bin \
            0x8000 firmware/Tasmota32/partitions.bin \
            0xe000 firmware/Tasmota32/boot_app0.bin \
            0x10000 firmware/Tasmota32/tasmota32.bin

#           0x10000 firmware/Tasmota32/tasmota32-webcam.bin
