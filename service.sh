#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

export PATH=$PATH:$MODDIR/bin

rclone mount WebDav: /storage/emulated/0/WebDav \
  --config $MODDIR/rclone.config \
  --allow-other \
  --allow-non-empty \
  --cache-dir $MODDIR/cache \
  --vfs-cache-mode writes \
  --vfs-cache-max-age 1m \
  --vfs-cache-max-size 1G \
  --vfs-cache-poll-interval 1m \
  --vfs-read-chunk-size 128M \
  --vfs-read-chunk-size-limit 1G \
  --buffer-size 1G \
  --dir-cache-time 1m \
  --poll-interval 1m \
  --umask 002 \
  --log-level INFO \
  --log-file $MODDIR/rclone.log \
  --daemon &

# This script will be executed in late_start service mode
# More info in the main Magisk thread
