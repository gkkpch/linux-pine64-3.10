cd $HOME/linux-pine64-sap
echo "Cleaning and preparing .config"
make clean
make sun50iw1p1smp_linux_defconfig
make menuconfig
cp .config.old arch/arm64/configs/sun50iw1p1smp_linux_defconfig.old
cp .config arch/arm64/configs/sun50iw1p1smp_linux_defconfig
echo "Compiling kernel"
make -j8 Image
echo "Making modules"
make -j8 modules
echo "Saving to NAS"
rm -r /media/nas/sap/platform-sap/sap/lib
make modules_install ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/media/nas/sap/platform-sap/sap
make firmware_install ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_FW_PATH=/media/nas/sap/platform-sap/sap/lib/firmware
cp arch/arm64/boot/Image /media/nas/sap/platform-sap/sap/boot/pine64

kver=`make kernelrelease`-`date +%Y.%m.%d-%H.%M`
cp .config /media/nas/sap/platform-sap/sap/boot/config-${kver}
echo "$kver" > /media/nas/sap/platform-sap/sap/boot/Image.version

cd $HOME
./make-dts.sh

echo "Compressing pine64"
cd /media/nas/sap/platform-sap
tar cvfJ sap.tar.xz ./sap
echo "Done"
