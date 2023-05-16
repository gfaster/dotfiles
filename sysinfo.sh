#!/bin/bash

OUTPUT="sysinfo.txt"

rm -f $OUTPUT

apt list --manual-installed >> $OUTPUT
