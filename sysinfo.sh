#!/bin/bash

OUTPUT="sysinfo.txt"

rm -rf $OUTPUT

apt list --manual-installed >> $OUTPUT
