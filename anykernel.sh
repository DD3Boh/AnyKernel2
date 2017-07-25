# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=
do.devicecheck=0
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=z2_plus
device.name2=z2131
device.name3=Z2
device.name4=z2
device.name5=Z2131
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk


## AnyKernel install
dump_boot;

# begin ramdisk changes

# begin ramdisk changes

# add custom tuning to init.rc
insert_line init.qcom.rc "import /init.darkmoon.rc" after "import /init.trace.rc" "import /init.darkmoon.rc\n";

# remove shit
remove_line init.qcom.power.rc "setprop sys.io.scheduler"

# end ramdisk changes

write_boot;

## end install

