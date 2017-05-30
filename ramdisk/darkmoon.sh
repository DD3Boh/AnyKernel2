#!/system/bin/sh

# Mount root as RW to apply tweaks and settings
busybox mount -o remount,rw /system
busybox mount -t rootfs -o remount,rw rootfs

# Install Busybox
/sbin/bb/busybox --install -s /sbin

BB="/system/xbin/busybox";

#zram tweaks
echo "0" > /proc/sys/kernel/randomize_va_space;
echo "0" > /proc/sys/vm/page-cluster;
echo "10" > /proc/sys/vm/dirty_ratio;
echo "50" > /proc/sys/vm/vfs_cache_pressure;
echo "5" > /proc/sys/vm/dirty_background_ratio;
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs;
echo "600" > /proc/sys/vm/dirty_expire_centisecs;
echo "45" > /proc/sys/vm/swappiness;
echo "4096" > /proc/sys/vm/min_free_kbytes;
echo "5120000" > /proc/sys/vm/dirty_background_bytes;

# Google Services battery drain fixer by Alcolawl@xda
pm enable com.google.android.gms/.update.SystemUpdateActivity
pm enable com.google.android.gms/.update.SystemUpdateService
pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
pm enable com.google.android.gsf/.update.SystemUpdateActivity
pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
pm enable com.google.android.gsf/.update.SystemUpdateService
pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver