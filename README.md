# esptool-sonoff-tasmota


```
there is no need to install esptool
downloading:
flashing:


git clone https://github.com/Alex2269/esptool-sonoff


for esp8266 RavenSystem:
cd esptool-sonoff/RavenSystem
sh flash.sh

for esp8266 sonoff:
cd esptool-sonoff/Sonoff-Homekit
sh flash.sh

for esp8266 HAA OTA - SETUP MODE:
cd esptool-sonoff/Sonoff-Homekit
sh flash-haaboot.sh


for esp32 tasmota:
cd esptool-sonoff/tasmota_esp32
sh flash.sh

for esp8266 tasmota:
cd esptool-sonoff/tasmota_esp8266
sh flash.sh




example without cloning:

cd /tmp
wget https://github.com/Alex2269/esptool-sonoff/archive/main.zip -O esptool-sonoff.zip
unzip esptool-sonoff.zip -d /tmp
cd /tmp/esptool-sonoff-main/RavenSystem
sh flash-fullhaaboot.sh


```

base code:

https://github.com/espressif/esptool

https://github.com/arendst/Tasmota
