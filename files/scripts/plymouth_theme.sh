#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'Changing plymouth theme'

#plymouthCONF=/usr/share/plymouth/themes/spinner/spinner.plymouth

backgroundSTART=BackgroundStartColor=0xFFFFFF
backgroundEND=BackgroundEndColor=0xFFFFFF
progressBB=ProgressBarBackgroundColor=0xCCCCCC
progressBF=ProgressBarForegroundColor=0x000000

sed -i "s/^BackgroundStartColor=.*/${backgroundSTART}/" "${plymouthCONF}"
sed -i "s/^BackgroundEndColor=.*/${backgroundEND}/" "${plymouthCONF}"
sed -i "s/^ProgressBarBackgroundColor=.*/${progressBB}/" "${plymouthCONF}"
sed -i "s/^ProgressBarForegroundColor=.*/${progressBF}/" "${plymouthCONF}"
