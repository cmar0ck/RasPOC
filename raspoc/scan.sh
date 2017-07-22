#!/bin/bash

# CONFIGURATION
ENV="~/raspoc" 	# Working directory (for e.g '~/raspoc')
FRQ="" 		# Frequency you want to scan (for e.g. 123.000M") 
PPM="0" 		# Inaccuracy correction offset of your SDR device (can be figured out with gqrx)

# START SCANNING 
rtl_fm -f $FRQ -p $PPM -s 22050 | multimon-ng -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -f alpha /dev/stdin | while IFS= read -r line; do echo "$(date) $line"; done >> $ENV/scan.log
