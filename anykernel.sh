# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=
do.devicecheck=0
do.initd=0
do.modules=1
do.cleanup=1
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
insert_line default.prop "persist.sys.usb.config=mtp" after "persist.sys.usb.config=none" "ro.patcher.device=z2_plus";
#nothing changed

# add custom tuning to init.rc
insert_line init.qcom.rc "import /init.darkmoon.rc" after "import /init.trace.rc" "import /init.darkmoon.rc\n";

# add spectrum support
insert_line init.qcom.rc "import /init.spectrum.rc" after "import /init.darkmoon.rc" "import /init.spectrum.rc\n";

# remove shit
remove_line init.qcom.power.rc "setprop sys.io.scheduler"

# end ramdisk changes

write_boot;

## end install

