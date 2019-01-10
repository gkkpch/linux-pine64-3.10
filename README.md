
#Kernel for sap and other useful information
 
Kernel

- Clone this repo to your home folder  
- Clone the volumio platform files to your home folder  
- Edit sap-build-kernel.sh to reflect the locations (first line and where it says "Compressing"  
- You can use sap-build-kenel.sh to build the kernel (or do it manually as you like)  
- make_dts.sh is using the dts files we adapted for sopine.
This produces the dtb for sopine and is the one you should use

Note: thereis an issue still with lcd panel, we will take care of that and inform when done.

boot-tools-pine64 was be used to (re)build u-boot
Use it if necessary:

	cd boot-tools-pine64
	make clean
	make pine64-sopine

The output is in boot-tools-pine64/boot/pine64
 