# RasPOC (Raspberry Pi POCSAG Decoder)

Features: 

Automated scanning and decoding in the background, needs very little to no user input once set up properly, filterable results, file-based logging (so no need for setting up a database).

(It can also be used to decode FLEX, EAS, UFSK1200, CLIPFSK, AFSK1200, AFSK2400, AFSK2400_2, AFSK2400_3, HAPN4800, FSK9600, DTMF, ZVEI1, ZVEI2, ZVEI3, DZVEI, PZVEI, EEA, EIA, CCIR and MORSE CW)

Requirements:

+ Raspberry Pi
+ [Kali Linux](https://www.offensive-security.com/kali-linux-arm-images/)
+ RTL SDR device (works with most [cheapo DVB-T USB sticks](http://www.ebay.com/sch/i.html?_from=R40&_sacat=0&LH_BIN=1&_nkw=rtl2832u&_sop=15)!)

Usage: 

+ Install Kali Linux on Raspberry Pi
+ Run 'setup.sh' installer script
+ Enter desired frequency in scan.sh
+ Run scan.sh

Happy decoding.
