#!bin/bash
set -e

# I use 1password, I have a separate file that does just 1password setup
# You should look at it, and verify the script for yourself
install_1password=true
export install_1password

sh ./installs.sh
$install_1password && sh ./1password.sh
sh ./configure.sh
