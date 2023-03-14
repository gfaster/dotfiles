#!/bin/bash

OUTPUT="sysinfo.txt"

rm -rf $OUTPUT

lscpu >> $OUTPUT
echo "---------------------------------------------" >> $OUTPUT
apt list --manual-installed >> $OUTPUT
