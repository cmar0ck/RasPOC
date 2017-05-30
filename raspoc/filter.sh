#!/bin/bash

# CONFIGURATION
ENV="~/raspoc"
TIMETRAIL=$(date "+%m_%Y")

# Kill active processes first
pkill rtl_fm
pkill tail

# START FILTERING (addresses in whitelist.txt will end up in results, addresses in blacklist.txt are discarded, unspecified addresses end up in review)
php $ENV/filter.php $ENV/whitelist.txt $ENV/scan.log >> $ENV/results_$TIMETRAIL.txt

grep -Fvf $ENV/results_$TIMETRAIL.txt $ENV/scan.log > $ENV/review_temp1.txt
php $ENV/filter.php $ENV/blacklist.txt $ENV/review_temp1.txt > $ENV/review_temp2.txt

grep -Fvf $ENV/review_temp2.txt $ENV/review_temp1.txt >> $ENV/review_$TIMETRAIL.txt

# Delete and recreate scan.log
rm -f $ENV/scan.log
touch $ENV/scan.log

# Cleanup temporary files
rm -f $ENV/review_temp1.txt
rm -f $ENV/review_temp2.txt

# Start scanning again
sh $ENV/scan.sh
