#!/bin/sh
cd patched-dts

echo "Compiling device tree from pine64.dts"
dtc -Odtb -o "sun50i-a64-pine64-plus.dtb" "pine64.dts"
echo "Compiling device tree from pine64noplus.dts"
dtc -Odtb -o "sun50i-a64-pine64.dtb" "pine64noplus.dts"
echo "Compiling device tree from pine64so.dts"
dtc -Odtb -o "sun50i-a64-pine64-sopine.dtb" "pine64so.dts"

cp *.dtb /media/nas/sap/platform-sap/sap/boot/pine64
cp *.dts /media/nas/sap/platform-sap/sap/patched-dts

