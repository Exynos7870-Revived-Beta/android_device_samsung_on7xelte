# TWRP for the Samsung Galaxy On7 Pro / J7 Prime

TWRP device tree for Samsung Galaxy On7 Pro / J7 Prime (`on7xelte`), based on the TWRP AOSP 12.1 manifest.

## Build
```bash
source build/envsetup.sh
lunch twrp_on7xelte-eng
mka recoveryimage
```
The recovery image is `out/target/product/on7xelte/recovery.img`.
