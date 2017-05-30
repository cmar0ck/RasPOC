# RasPOC (Raspberry Pi POCSAG Decoder)

Features: 

Automated scanning and decoding in the background, needs very little to no user input once set up properly, filterable results.

Requirements:

+ Raspberry Pi
+ [Kali Linux](https://www.offensive-security.com/kali-linux-arm-images/)
+ RTL SDR device (works with most [cheapo DVB-T USB sticks](http://www.ebay.com/sch/i.html?_from=R40&_sacat=0&LH_BIN=1&_nkw=rtl2832u&_sop=15)!)

Usage: 

+ Install Kali Linux on Raspberry Pi
+ Run 'raspoc.sh' installer script
+ Copy 'raspoc' folder to '~/'
+ Enter desired frequency in scan.sh (if you are unsure about 'PPM' just enter '1')
+ Run scan.sh

Happy decoding.
