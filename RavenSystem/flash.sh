#!/bin/bash

export PATH=$(pwd)/../esptool:$PATH

VARIANT="haaboot"
# VARIANT="haa_lcm"
# VARIANT="haamain"


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


# is not required below
# all down code no need
# all code below, only to view result in tty-terminal


# color defines
black='\033[0;30m'
BLACK='\033[1;30m'
red='\033[0;31m'
RED='\033[1;31m'
green='\033[0;32m'
GREEN='\033[1;32m'
yellow='\033[0;33m'
YELLOW='\033[1;33m'
blue='\033[0;34m'
BLUE='\033[1;34m'
magenta='\033[0;35m'
MAGENTA='\033[1;35m'
cyan='\033[0;36m'
CYAN='\033[1;36m'
white='\033[0;37m'
WHITE='\033[1;37m'
NC='\033[0m'

# setterm termios

echo "${CYAN}\t\n ctrl+c for stoped tty monitor\n${NC}"
sleep 1 # sleeping one seconds
echo "${YELLOW}\t\n ctrl+c for exit \n${NC}"
sleep 1 # sleeping one seconds
stty -F $PORT 115200 cs8 -cstopb -parity -icanon min 1 time 1
# read usbseriall
sleep 1 # sleeping one seconds
cat $PORT


