#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:8dc51ada69f4332d6e6dce719c9c52d487a2d453; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:3ea83f9ce841aaeb18e3c2626d94fc336abf6d6e \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:8dc51ada69f4332d6e6dce719c9c52d487a2d453 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
